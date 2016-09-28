//
//  DataProvider.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import BoltsSwift

public class DataProvider:DataProviderProtocol
{
    var apiClient:ApiClientProtocol?
    var cacheProvider:CacheProviderProtocol?
    
   public required init(apiClient: ApiClientProtocol?, cacheProvider: CacheProviderProtocol?) {
        self.apiClient=apiClient
        self.cacheProvider=cacheProvider
    }
    
      
    
}