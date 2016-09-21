//
//  Task.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//
 import Foundation

public class Action<TMessage:MessageProtocol>
{
    private var action:((message: TMessage)->(TMessage))
    private var data: TMessage?
    public var initialMessage:TMessage?{get{return data}}

    required public init(action:((message: TMessage)->(TMessage)),message: TMessage?)
    {
        self.action = action
        self.data = message
    }
    
    public func performAction()->TMessage
    {
      return self.action(message: self.data!)
    }
    
}
public class CallbackAction<TMessage:MessageProtocol>
{
    private var action:(TMessage)->()
    
    
    required public init(action: (TMessage)->())
    {
        self.action = action
      
    }
    
    public func performAction(message: TMessage)
    {
        self.action(message)
    }
}