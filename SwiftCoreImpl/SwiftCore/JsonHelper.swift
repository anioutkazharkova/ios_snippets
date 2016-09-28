//
//  JsonHelper.swift
//  SwiftCore
//
//  Created by Admin on 28.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import EVReflection

public class JsonHelper
{
    public static let instance = JsonHelper()
    private init()
    {
        
    }
    func serializeToString(object: EVObject)->String
    {
        
        return object.toJsonString()
    }
    func serializeToDictionary(object: EVObject)->NSDictionary
    {
        
        return object.toDictionary()
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
    func serializeToString()->String
    {
        return JsonHelper().serializeToString(self)
    }
    func serializeToDictionary()->NSDictionary
    {
        return JsonHelper().serializeToDictionary(self)
    }
}
