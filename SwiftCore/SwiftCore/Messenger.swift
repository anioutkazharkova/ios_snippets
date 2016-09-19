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
var _messenger = MessengerHub()
    
  required init(dataProvider: DataProviderProtocol!) {
        self.dataProvider=dataProvider
    _messenger.tokens["\(GetImageMessage.self)"] = SubToken<GetImageMessage>(type: GetImageMessage.self, action: processGetImage)
    
    }
   private func processGetImage(message: GetImageMessage)->GetImageMessage
    {
     let result = self.dataProvider.getImageByUrl(message.content!)
        message.content?.imageData=result.imageData
        return message
    }
    
    func publish<TMessage:MessageProtocol>(message: TMessage)
    {
          _messenger.publish(message)
    }
    
  
    
}