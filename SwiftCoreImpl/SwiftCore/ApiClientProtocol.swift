//
//  ApiClientProtocol.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import BoltsSwift

public protocol  ApiClientProtocol {
     init(downloader:RestClientProtocol?)
    
    func getImageByUrl(url:String)->Task<NSData?>
}