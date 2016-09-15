//
//  ApiClient.swift
//  SwiftCore
//
//  Created by Admin on 15.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class ApiClient:ApiProtocol
{
    var downloader:DownloaderProtocol!
    
    init(downloader:DownloaderProtocol!)
    {
        self.downloader=downloader
    }
    func getImageByUrl(url: String) -> NSData! {
       return downloader?.DownloadFile(url)
    }
}