//
//  CacheProviderProtocol.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

public protocol  CacheProviderProtocol {
 
    func saveImage(image: ImageTable)->()
    func getImage(url: String)->ImageTable?
}