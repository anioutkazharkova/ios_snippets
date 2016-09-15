//
//  MessengerProtocol.swift
//  SwiftCore
//
//  Created by Admin on 15.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

protocol  MessengerProtocol {
   
    func getImageByUrl(url:String,callback:(NSData!)->Void)
}