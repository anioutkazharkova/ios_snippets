//
//  MessengerHelper.swift
//  SwiftCore
//
//  Created by Admin on 19.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

internal class SubToken<TMessage:MessageProtocol>:TokenProtocol
{
    private var messageType:MessageProtocol.Type
   
    var action:(message: TMessage)->TMessage
    required init(type: MessageProtocol.Type,action: (message: TMessage)->TMessage)
    {
        self.messageType=type
        self.action=action
        
    }
    
}
protocol  TokenProtocol {
    
}
class MessengerHub:MessengerHubProtocol{
   
   private var tokens = [String:TokenProtocol]()

    
    func addInnerSubscriber<TMessage:MessageProtocol>(type: MessageProtocol.Type,action: (message: TMessage)->TMessage)->()
    {
        tokens["\(type)"]=SubToken<TMessage>(type: type, action: action)
    }
    func removeInnerSubscriber<TMessage:MessageProtocol>(token: SubToken<TMessage>)
    {
        tokens["\(TMessage.self)"]=nil
    }
    
    func publish<TMessage:MessageProtocol>(message: TMessage,callback: MessageCallback<TMessage>)
    {
       if let t = tokens["\(message.dynamicType)"]
        {
            if let token = t as? SubToken<TMessage>
           {
            publish(token, message: message,callback: callback)
           }
        }
    }
    

    private  func publish<TMessage:MessageProtocol>(token: SubToken<TMessage>,message: TMessage,callback:MessageCallback<TMessage>)
    {
       let task = Task<TMessage>(callback: callback)
        task.execute(message, token: token)
      }

}
protocol  MessengerHubProtocol {
    func addInnerSubscriber<TMessage:MessageProtocol>(type: MessageProtocol.Type,action: (message: TMessage)->TMessage)->()
    func removeInnerSubscriber<TMessage:MessageProtocol>(token: SubToken<TMessage>)
    func publish<TMessage:MessageProtocol>(message: TMessage,callback: MessageCallback<TMessage>)

}