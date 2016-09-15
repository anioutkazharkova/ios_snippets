//
//  Downloader.swift
//  SwiftCore
//
//  Created by Admin on 15.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class Downloader:DownloaderProtocol
{
    func DownloadFile(urlPath: String) -> NSData! {
        let data = NSData(contentsOfURL: NSURL(string: urlPath)!)
        return data
        
    }
}