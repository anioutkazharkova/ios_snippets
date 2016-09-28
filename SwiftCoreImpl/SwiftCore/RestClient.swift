//
//  RestClient.swift
//  SwiftCore
//
//  Created by Admin on 28.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import Alamofire
import BoltsSwift

public enum HttpMethod
{
    case Get
    case Post
    case Put
    
}
//Abstraction for rest Alamofire-client
public class RestClient:RestClientProtocol
{
    internal init()
    {
        
    }
 public final func downloadFile(path: String)->Task<NSData?>
    {
         let queue = dispatch_queue_create("rest_client", DISPATCH_QUEUE_CONCURRENT)
        let task = TaskCompletionSource<NSData?>()
       let request = setAuth(Alamofire.request(.GET,prepareUrl(path)))
        request.validate(statusCode: 200..<399).responseData(completionHandler: {
        response in
            dispatch_async(queue)
            {
            switch response.result {
            case .Success( _):
                dispatch_async(dispatch_get_main_queue())
                {
               task.set(result: response.result.value)
                }
            case .Failure(let error):
                dispatch_async(dispatch_get_main_queue())
                {
                task.set(error: error)
                }
            }
            }
        })
        return task.task
    }
  public final func download(path: String,parameters:[String:AnyObject]?,method: HttpMethod)->Task<ServerResponse>
    {
        let queue = dispatch_queue_create("rest_client", DISPATCH_QUEUE_CONCURRENT)
        var request:Request?
        let task = TaskCompletionSource<ServerResponse>()
        switch (method) {
        case .Get:
            request = getRequest(path)
        case .Post:
            request = postJSONRequest(path, parameters: parameters)
        case .Put:
            request = putRequest(path,parameters: parameters)
        }
        if let r = request
        {
       request = setAuth(r)
        }
        request?.validate(statusCode: 200..<399).responseString(completionHandler: {
        response in
            dispatch_async(queue)
            {
            switch response.result {
            case .Success( _):
               let _response = ServerResponse(code: response.response?.statusCode ?? 0, body: response.result.value ?? "")
               dispatch_async(dispatch_get_main_queue())
               {
               task.set(result: _response)
                }
            case .Failure(let error):
                let _response = ServerResponse(code: error.code,body: error.localizedDescription)
                dispatch_async(dispatch_get_main_queue())
                {
                    task.set(result: _response)
                }
            }
            }
        
        })
        return task.task
    }
    
    func setAuth(request: Request)->Request
    {
        return request
    }
    func getHeaders()->[String:String]?
    {
       return nil
    }
   private func postFormRequest(path: String,parameters:[String:AnyObject]?)->Request
    {
       
        return Alamofire.request(.POST, prepareUrl(path), parameters: parameters,encoding:  ParameterEncoding.URL,headers: getHeaders())
    }
    private func putRequest(path: String,parameters:[String:AnyObject]?)->Request
    {
        return Alamofire.request(.PUT, prepareUrl(path), parameters: parameters, encoding: ParameterEncoding.JSON, headers: getHeaders())
    }

    private func postJSONRequest(path: String,parameters:[String:AnyObject]?)->Request
    {
      return Alamofire.request(.POST, prepareUrl(path), parameters: parameters, encoding: ParameterEncoding.JSON, headers: getHeaders())
    }
    private func getRequest(path: String)->Request
    {
     return Alamofire.request(.GET, prepareUrl(path))
    }
   
    
    private func prepareUrl(path: String)->String
    {
        return path.isEmpty ? Configuration.address : Configuration.address+path
    }
}
public protocol RestClientProtocol
{
    func downloadFile(path: String)->Task<NSData?>
    func download(path: String,parameters:[String:AnyObject]?,method: HttpMethod)->Task<ServerResponse>
}