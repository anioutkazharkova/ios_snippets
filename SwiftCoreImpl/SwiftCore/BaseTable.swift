//
//  BaseTable.swift
//  SwiftCore
//
//  Created by Admin on 28.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import RealmSwift

public class BaseTable:Object
{
    public dynamic var id=0
    
    override public static func primaryKey() -> String? {
        return "id"
    }
}