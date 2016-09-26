
//
//  RestClient.swift
//  SimpleRestClient
//
//  Created by Admin on 26.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

enum HttpMethod{
    case GET
    case POST
    case DELETE}


class RestClient
{
    let todoEndpoint: String = "http://jsonplaceholder.typicode.com/"
    
    func processRequest(path: String,data: String,callback:String->(),method: HttpMethod)->()
    {
    if  let request = prepareRequest(path, data: data, method: method)
    {
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) in
            guard error == nil else {
               
                print(error)
                return
            }
            if let d = data {
                if let json = String(data: d, encoding: NSUTF8StringEncoding){
                    dispatch_async(dispatch_get_main_queue())
                    {callback(json)
                    }
                }
            }
        })
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0))
        {
        task.resume()
        }
        }
        
    }
    
   private func prepareRequest(path: String, data: String,method: HttpMethod)->NSURLRequest?
    {
        let requestUrl=(path.isEmpty ? todoEndpoint : (todoEndpoint+"/"+path))
        guard let url = NSURL(string: requestUrl) else
        {
            print("Can't create url")
            return nil
        }
        
        switch method {
        case .GET:
            return NSURLRequest(URL: url)
        case .POST:
           let request = NSMutableURLRequest(URL: url)
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
           
            request.HTTPMethod = "POST"
            if (!data.isEmpty)
            {
                request.HTTPBody = NSData(data: data.dataUsingEncoding(NSUTF8StringEncoding)!)
                return request
           }
            return nil
        case .DELETE:
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "DELETE"
            return request
       
        }
    }
   
    
   
    
}
