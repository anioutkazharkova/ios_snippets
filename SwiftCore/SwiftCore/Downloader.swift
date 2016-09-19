//
//  Downloader.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class Downloader:NetworkProtocol
{
    
    func downloadFile(url: String) -> NSData! {
       
    return NSData(contentsOfURL: NSURL(string: url)!)
    }
}