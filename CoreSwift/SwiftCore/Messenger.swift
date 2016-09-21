//
//  Messenger.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import SwiftTinyMessenger

class Messenger:SwiftMessenger
{
 private var dataProvider:DataProviderProtocol?
    
  required init(dataProvider: SwiftDataProviderProtocol?) {
   super.init()
   self.dataProvider=dataProvider as? DataProviderProtocol

    }
   
internal override func startServices()
{
     self._messenger?.addInnerSubscriber(GetImageMessage.self, action: processGetImage)
}
 
  
    
private func processGetImage(message: GetImageMessage)->GetImageMessage
{
        let result = self.dataProvider?.getImageByUrl(message.content!)
    if let r = result{
        message.content?.imageData=r.imageData
    }
        return message
}
    
}
