//
//  GetImageMessage.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class  GetImageMessage: AppMessage<ImageModel>
{
    required init(callback: CallbackProtocol) {
        super.init(callback: callback)
    }
}