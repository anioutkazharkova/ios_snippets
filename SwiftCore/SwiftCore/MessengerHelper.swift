//
//  MessengerHelper.swift
//  SwiftCore
//
//  Created by Admin on 19.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class SubToken<TMessage:MessageProtocol>:TokenProtocol
{
    private var messageType:MessageProtocol.Type
    
    private var action:(message: TMessage)->TMessage
    var asyncPublisher=AsyncTasker<TMessage>()
    
    required init(type: MessageProtocol.Type,action: (message: TMessage)->TMessage)
    {
        self.messageType=type
        self.action=action
        
    }
    func cancel()
    {
        self.asyncPublisher.cancel()
    }
}
protocol  TokenProtocol {
    
}
class MessengerHub{
    
    var tokens = [String:TokenProtocol]()
    
    func publish<TMessage:MessageProtocol>(message: TMessage)
    {
        if let t = tokens["\(message.dynamicType)"]
        {
            if let token = t as? SubToken<TMessage>
            {
            publish(token, message: message)
            }
        }
    }

    func publish<TMessage:MessageProtocol>(token: SubToken<TMessage>,message: TMessage)
    {
        let  task = Task<TMessage>(action: token.action, message: message)
        let callback = CallbackTask<TMessage>(action:self.setCallback)
        token.asyncPublisher.performAction(task, callback: callback)
        
     /*
    token.asyncPublisher.performAction(Task<TMessage>(action: token.action,message: message),callback:CallbackTask<TMessage>(action: self.setCallback))*/
       
    }
    func setCallback<TMessage:MessageProtocol>(message: TMessage)
    {
       if let callback = message.callback as? MessageCallback<TMessage>
       {
         callback.callAction(message)
        
    }
    }
}