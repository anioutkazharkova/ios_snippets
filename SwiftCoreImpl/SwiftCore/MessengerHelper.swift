//
//  MessengerHelper.swift
//  SwiftCore
//
//  Created by Admin on 19.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import BoltsSwift

//Simple abstraction for generic tokens
protocol  TokenProtocol {}

//Token class to store an action for type of AppMessage
class SubToken<TMessage:MessageProtocol>:TokenProtocol
{
    
    private var _messageType:MessageProtocol.Type
    var action:(message: TMessage)->Task<TMessage>
    
    required init(type: MessageProtocol.Type,action: (message: TMessage)->Task<TMessage>)
    {
        self._messageType=type
        self.action=action
        
    }
    
}


extension SwiftMessenger
{
    //Inner manager for tokens and actions
internal class MessengerHub:MessengerHubProtocol{
   
   private var _tokens = [String:TokenProtocol]()

    //Save an action for message type to collection
   internal func addInnerSubscriber<TMessage:MessageProtocol>(type: MessageProtocol.Type,action: (message: TMessage)->Task<TMessage>)->()
    {
        self._tokens["\(type)"]=SubToken<TMessage>(type: type, action: action)
    }
    //Remove all tokens from collection
   internal func removeInnerSubscribers()->()
    {
       self._tokens=[String:TokenProtocol]()
    }
    
    //Retrieve token action to be applied to current message
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
    

    //Apply action to message and send the result to callback method
    private  func publish<TMessage:MessageProtocol>(token: SubToken<TMessage>,message: TMessage,callback:MessageCallback<TMessage>)
    {
        //Uses Bolts Task Framework to return the callback when action will be completed 
     let task = token.action(message: message)
      
        task.continueWith(continuation:
            {
                t in
               if let result = t.result
                {
                    callback.callAction(result)
                }
        })
        
      }

}

}
public protocol  MessengerHubProtocol {
    func addInnerSubscriber<TMessage:MessageProtocol>(type: MessageProtocol.Type,action: (message: TMessage)->Task<TMessage>)->()
    func removeInnerSubscribers()->()
    func publish<TMessage:MessageProtocol>(message: TMessage,callback: MessageCallback<TMessage>)
    
}