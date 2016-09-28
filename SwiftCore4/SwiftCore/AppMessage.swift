//
//  AppMessage.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

public class AppMessage<TModel>:MessageProtocol{
   private var _delegate:TaskTokenProtocol?
    private var _isCanceled:Bool=false
    
    public var content:TModel?
    public var isCanceled:Bool{get{return _isCanceled} set{_isCanceled=newValue}}
    
    public init()
    {
        
    }
    
  public func cancel() {
        self._delegate?.cancelTask()
    }
    public func setDelegate(delegate: TaskTokenProtocol?) {
        self._delegate=delegate
    }
  
}
public protocol MessageProtocol {
  
    var isCanceled:Bool{get set}
    func cancel()->()
    func setDelegate(delegate: TaskTokenProtocol?)->()
}
