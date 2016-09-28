//
//  DataProviderProtocol.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import BoltsSwift

public protocol DataProviderProtocol
{
    init(apiClient:ApiClientProtocol?,cacheProvider:CacheProviderProtocol?)
    
    func getImageByUrl(data:ImageModel)->Task<ImageModel>
    
}