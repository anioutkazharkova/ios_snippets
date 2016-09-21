//
//  NetworkProtocol.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

protocol  NetworkProtocol:SwiftNetworkProtocol {
  
    func downloadFile(url:String)->NSData!
}
protocol  SwiftNetworkProtocol {
    
}