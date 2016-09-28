
//
//  ServerResponse.swift
//  SwiftCore
//
//  Created by Admin on 28.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

public class  ServerResponse {
    var _code:Int=0
    var _body:String=""
    
    public var code:Int{get {return _code}}
    public var body:String{get{return _body}}
    
    required public init(code: Int, body: String)
    {
        self._code = code
        self._body = body
    }
}