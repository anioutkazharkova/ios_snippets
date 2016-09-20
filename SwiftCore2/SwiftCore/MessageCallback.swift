//
//  MessageCallback.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class  MessageCallback<TMessage:MessageProtocol>:CallbackProtocol{
    
    var callbackAction:((message: TMessage)->())?
    required init(action: ((message: TMessage)->())?)
    {
        self.callbackAction=action
    }
    func callAction(message: TMessage)
    {
        self.callbackAction?(message: message)
    }
   
}
protocol  CallbackProtocol {
    
}
