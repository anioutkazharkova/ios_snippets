//
//  MessageCallback.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

public class  MessageCallback<TMessage:MessageProtocol>{
    
   private var callbackAction:((message: TMessage)->())?
    
    required public init(action: ((message: TMessage)->())?)
    {
        self.callbackAction=action
    }
  public func callAction(message: TMessage)
    {
        self.callbackAction?(message: message)
    }
   
}

