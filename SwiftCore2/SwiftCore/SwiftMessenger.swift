//
//  SwiftMessenger.swift
//  SwiftCore
//
//  Created by Admin on 21.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

public class SwiftMessenger:SwiftMessengerProtocol
{
    
    public var _messenger:MessengerHubProtocol?
    
    public init() {
        self._messenger=MessengerHub()
        startServices()
    }
    
    public func startServices()->()
    {
        
    }
    private func stopServices()->()
    {
        self._messenger?.removeInnerSubscribers()
    }
    
    
   public final func publish<TMessage:MessageProtocol>(message: TMessage,handler: MessageCallback<TMessage>)
    {
        self._messenger?.publish(message,callback: handler)
    }
   
    deinit
    {
        stopServices()
    }
    
}
public protocol  SwiftMessengerProtocol {
    
    func publish<TMessage:MessageProtocol>(message: TMessage,handler: MessageCallback<TMessage>)->()    
    
}
