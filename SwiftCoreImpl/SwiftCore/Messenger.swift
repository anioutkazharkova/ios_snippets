//
//  Messenger.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import BoltsSwift

public class Messenger:SwiftMessenger
{
 internal var dataProvider:DataProviderProtocol?
    
  required public init(dataProvider: DataProviderProtocol?) {
    super.init()
   self.dataProvider=dataProvider
  
    }
   
public override func startServices()
{
     self._messenger?.addInnerSubscriber(GetImageMessage.self, action: processGetImage)
}
 
  
    

    
}
