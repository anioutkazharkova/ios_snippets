//
//  Task.swift
//  SwiftCore
//
//  Created by Admin on 20.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation


public final class Task<TMessage:MessageProtocol>:TaskTokenProtocol
{
private var callback:MessageCallback<TMessage>
private var asyncTasker=AsyncTasker<TMessage>()
    
    required public init(callback: MessageCallback<TMessage>)
    {
        self.callback=callback
    }
    private func setCallback(message: TMessage)
    {
        self.callback.callAction(message)
    }
    func execute(message: TMessage,token: SubToken<TMessage>)->()
    {
        message.setDelegate(self)
        let  task = Action<TMessage>(action: token.action, message: message)
        let callback = CallbackAction<TMessage>(action:self.setCallback)
         self.asyncTasker.performAction(task, callback:callback)
    }
   private func cancel()
    {
        self.asyncTasker.cancelTask()
    }
    public func cancelTask() {
        self.cancel()
    }
   
}

public protocol  TaskTokenProtocol {
    func cancelTask()->()
    
}