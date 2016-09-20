//
//  Task.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//
 import Foundation

class Action<TMessage:MessageProtocol>
{
    private var action:((message: TMessage)->(TMessage))
    private var data: TMessage?
    var initialMessage:TMessage?{get{return data}}

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
class CallbackAction<TMessage:MessageProtocol>
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