//
//  ApiClientProtocol.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

protocol  ApiClientProtocol {
     init(downloader:NetworkProtocol!)
    
    func getImageByUrl(url:String)->NSData!
}