//
//  AppMessage.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class AppMessage<TModel>:MessageProtocol{
    private var _delegate:TaskTokenProtocol?
    private var _isCanceled:Bool=false
    var content:TModel?
    var isCanceled:Bool{get{return _isCanceled} set{_isCanceled=newValue}}
    func cancel() {
        self._delegate?.cancelTask()
    }
    func setDelegate(delegate: TaskTokenProtocol?) {
        self._delegate=delegate
    }
  
}
protocol MessageProtocol {
    
    var isCanceled:Bool{get set}
    func cancel()->()
    func setDelegate(delegate: TaskTokenProtocol?)->()
}
