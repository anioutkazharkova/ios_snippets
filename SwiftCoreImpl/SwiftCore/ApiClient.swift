//
//  ApiClient.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import BoltsSwift

//Api manager
public class ApiClient:ApiClientProtocol
{
    var downloader:RestClientProtocol?
    var jsonHelper = JsonHelper.instance
    
    required public init(downloader:RestClientProtocol?) {
        self.downloader=downloader
    }
    
  
}