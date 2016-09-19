//
//  AppMessage.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class AppMessage<TModel>:MessageProtocol{
    
    private var _callback:CallbackProtocol?
    var callback: CallbackProtocol?{get{return _callback} set{_callback=newValue}}
    var content:TModel?
    var isCanceled:Bool=false
    
  
    required init(callback:CallbackProtocol)
    {
    
       // if (callback.dynamicType == self.dynamicType)
       // {
            self._callback=callback
       // }
    }

}
protocol MessageProtocol {
    
    var callback:CallbackProtocol?{get set}
    
}
