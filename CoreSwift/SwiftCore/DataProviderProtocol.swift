//
//  DataProviderProtocol.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

protocol  SwiftDataProviderProtocol {
     init(apiClient:SwiftApiClientProtocol?,cacheProvider:SwiftCacheProviderProtocol?)
}
protocol DataProviderProtocol:SwiftDataProviderProtocol
{
    //init(apiClient:ApiClientProtocol!,cacheProvider:CacheProviderProtocol!)
    
    func getImageByUrl(data:ImageModel)->ImageModel
    
}