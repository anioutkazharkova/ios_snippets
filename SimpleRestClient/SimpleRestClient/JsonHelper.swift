
//
//  JsonHelper.swift
//  SimpleRestClient
//
//  Created by Admin on 26.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import EVReflection

class JsonHelper
{
    func serialize(object: EVObject)->String
    {
       return object.toJsonString()
    }
    func serialize(object: [EVObject])->String
    {
        return object.toJsonString()
    }
    func deserialize<T:EVObject>(type: T.Type,json: String)->T
    {
        return T(json: json) as T
    }
    func deserializeArray<T:EVObject>(type: T.Type,json: String)->[T]
    {
        return [T](json: json) as [T]
    }
    func deserialize<T:EVObject>(type: T.Type,json: NSDictionary)->T
    {
        return T(dictionary: json) as T
    }
    
}
extension EVObject
{
    func serialize()->String
    {
        return JsonHelper().serialize(self)
    }
}