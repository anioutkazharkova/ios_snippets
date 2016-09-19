//
//  Task.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class Task<TMessage:MessageProtocol>
{
    private var action:((message: TMessage)->(TMessage))
    private var data: TMessage?

    required init(action:((message: TMessage)->(TMessage)),message: TMessage?)
    {
        self.action = action
        self.data = message
    }
    
    func performAction()->TMessage
    {
      return self.action(message: self.data!)
    }
    func performAction(message: TMessage)
    {
        self.action(message: message)
    }
}
class CallbackTask<TMessage:MessageProtocol>
{
    private var action:(TMessage)->()
    
    
    required init(action: (TMessage)->())
    {
        self.action = action
      
    }
    
    func performAction(message: TMessage)
    {
        self.action(message)
    }
}