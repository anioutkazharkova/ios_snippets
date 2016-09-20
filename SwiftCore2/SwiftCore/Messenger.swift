//
//  Messenger.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class Messenger:MessengerProtocol
{
 private var dataProvider:DataProviderProtocol!
private var _messenger = MessengerHub()
    
  required init(dataProvider: DataProviderProtocol!) {
        self.dataProvider=dataProvider
  
    _messenger.addInnerSubscriber(GetImageMessage.self, action: processGetImage)
    }
   
  
    
    func publish<TMessage:MessageProtocol>(message: TMessage,handler: MessageCallback<TMessage>)
    {
        _messenger.publish(message,callback: handler)
    }
    
    private func processGetImage(message: GetImageMessage)->GetImageMessage
    {
        let result = self.dataProvider.getImageByUrl(message.content!)
        message.content?.imageData=result.imageData
        return message
    }
    
}
protocol  MessengerProtocol {   
    
    init(dataProvider:DataProviderProtocol!)
    func publish<TMessage:MessageProtocol>(message: TMessage,handler: MessageCallback<TMessage>)->()
   
    
}