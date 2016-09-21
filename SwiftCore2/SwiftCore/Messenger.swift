//
//  Messenger.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class Messenger:SwiftMessenger
{
 private var dataProvider:DataProviderProtocol!
    
  required init(dataProvider: DataProviderProtocol!) {
    super.init()
   self.dataProvider=dataProvider
  
    }
   
internal override func startServices()
{
     self._messenger?.addInnerSubscriber(GetImageMessage.self, action: processGetImage)
}
 
  
    
private func processGetImage(message: GetImageMessage)->GetImageMessage
{
        let result = self.dataProvider.getImageByUrl(message.content!)
        message.content?.imageData=result.imageData
        return message
}
    
}
