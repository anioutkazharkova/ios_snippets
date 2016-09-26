
//
//  Todo.swift
//  SimpleRestClient
//
//  Created by Admin on 26.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import EVReflection

class Todo:EVObject
{
    var userId:Int=0
    var id:Int = 0
    var title:String=""
    var completed:Bool=false
    var body:String=""
    
    
}

/*
protocol PropertyNames {
    func propertyNames() -> [(String,Any,Any)]
}

extension PropertyNames
{
    func propertyNames() -> [(String,Any,Any)] {
        var data = [(String,Any,Any)]()
        for c in Mirror(reflecting: self).children
        {if let name = c.label
        {
          data.append((name,c.value.dynamicType,c.value))
         }
        }
        return data
    }
}*/