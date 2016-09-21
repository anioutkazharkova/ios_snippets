//
//  ApiClientProtocol.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation


protocol SwiftApiClientProtocol
{
     init(downloader:SwiftNetworkProtocol?)
}

protocol  ApiClientProtocol:SwiftApiClientProtocol {
    
    func getImageByUrl(url:String)->NSData!
}