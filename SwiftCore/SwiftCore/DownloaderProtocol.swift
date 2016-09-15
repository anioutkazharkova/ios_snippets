//
//  DownloaderProtocol.swift
//  SwiftCore
//
//  Created by Admin on 15.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

protocol  DownloaderProtocol {
    func DownloadFile(urlPath:String)->NSData!
}