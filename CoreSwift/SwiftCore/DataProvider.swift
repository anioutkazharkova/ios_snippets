//
//  DataProvider.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class DataProvider:DataProviderProtocol
{
    private var apiClient:ApiClientProtocol?
    private var cacheProvider:CacheProviderProtocol?
    
    required init(apiClient: SwiftApiClientProtocol?, cacheProvider: SwiftCacheProviderProtocol?) {
        self.apiClient=apiClient as? ApiClientProtocol
        self.cacheProvider=cacheProvider as? CacheProviderProtocol
    }
    
    func getImageByUrl(data:ImageModel)->ImageModel
    {
        let result = self.apiClient!.getImageByUrl(data.imageUrl!)
        data.imageData=result
        return data
    }
    
    
}