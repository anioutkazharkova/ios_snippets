//
//  AppMessage.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

public class AppMessage<TModel>:MessageProtocol{
   
    private var _isCanceled:Bool=false
    
    public var content:TModel?
    public var isCanceled:Bool{get{return _isCanceled} set{_isCanceled=newValue}}
    
    public init()
    {
        
    }
    
 
  
}
public protocol MessageProtocol {
  
    var isCanceled:Bool{get set}
    
    
}
