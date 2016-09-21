//
//  MessengerHelper.swift
//  SwiftCore
//
//  Created by Admin on 19.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

protocol  TokenProtocol {}
class SubToken<TMessage:MessageProtocol>:TokenProtocol
{
    
    private var _messageType:MessageProtocol.Type
    var action:(message: TMessage)->TMessage
    
    required init(type: MessageProtocol.Type,action: (message: TMessage)->TMessage)
    {
        self._messageType=type
        self.action=action
        
    }
    
}


extension SwiftMessenger
{
internal class MessengerHub:MessengerHubProtocol{
   
   private var _tokens = [String:TokenProtocol]()

    
   internal func addInnerSubscriber<TMessage:MessageProtocol>(type: MessageProtocol.Type,action: (message: TMessage)->TMessage)->()
    {
        self._tokens["\(type)"]=SubToken<TMessage>(type: type, action: action)
    }
   internal func removeInnerSubscribers()->()
    {
       self._tokens=[String:TokenProtocol]()
    }
    
    internal func publish<TMessage:MessageProtocol>(message: TMessage,callback: MessageCallback<TMessage>)
    {
        if let t = self._tokens["\(message.dynamicType)"]
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

}
public protocol  MessengerHubProtocol {
    func addInnerSubscriber<TMessage:MessageProtocol>(type: MessageProtocol.Type,action: (message: TMessage)->TMessage)->()
    func removeInnerSubscribers()->()
    func publish<TMessage:MessageProtocol>(message: TMessage,callback: MessageCallback<TMessage>)
    
}