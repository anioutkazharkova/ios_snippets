//
//  RestClientFactory.swift
//  SwiftCore
//
//  Created by Admin on 28.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import Alamofire


public class SimpleRestClient:RestClient
{
    public override init()
    {
        super.init()
    }
   public override func setAuth(request: Request) -> Request {
        return super.setAuth(request)
    }
   public override func getHeaders() -> [String : String]? {
        return super.getHeaders()
    }
}

public class SecuredRestClient:RestClient
{
   public override init()
    {
        super.init()
    }
   public override func setAuth(request: Request) -> Request {
        return super.setAuth(request)
    }
    public override func getHeaders() -> [String : String]? {
        //Something like this
        /*
         let user = "user"
         let password = "password"
         
         let credentialData = "\(user):\(password)".dataUsingEncoding(NSUTF8StringEncoding)!
         let base64Credentials = credentialData.base64EncodedStringWithOptions([])
         
         let headers = ["Authorization": "Basic \(base64Credentials)"]
         
         return headers
         */
        return super.getHeaders()
    }
}
public protocol RestClientFactoryProtocol
{
    func createRestClient(isSecured: Bool)->RestClientProtocol
}
public class RestClientFactory:RestClientFactoryProtocol
{
    public static let instance = RestClientFactory()
    private init()
    {
        
    }
   public func createRestClient(isSecured: Bool) -> RestClientProtocol {
        return (isSecured ? SecuredRestClient() : SimpleRestClient())
    }
}