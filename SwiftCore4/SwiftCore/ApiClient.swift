//
//  ApiClient.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class ApiClient:ApiClientProtocol
{
    private var downloader:NetworkProtocol!
    
    required init(downloader: NetworkProtocol!) {
        self.downloader=downloader
    }
    func  getImageByUrl(url:String)->NSData!
    {
    return self.downloader?.downloadFile(url)
    }
}