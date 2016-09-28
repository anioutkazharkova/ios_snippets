//
//  ApiClientSampleExtension.swift
//  SwiftCore
//
//  Created by Admin on 28.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import BoltsSwift

extension ApiClient
{
    //Sample method
    public func  getImageByUrl(url:String)->Task<NSData?>
    {
        let tcs = TaskCompletionSource<NSData?>()
        
        self.downloader?.downloadFile(url).continueWith(continuation: {task in
            tcs.set(result: task.result!)
        })
        return tcs.task
    }
}