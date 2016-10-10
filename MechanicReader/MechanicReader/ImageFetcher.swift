//
//  ImageFetcher.swift
//  MechanicReader
//
//  Created by Admin on 10.10.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import BoltsSwift


public class ImageFetcher
{
    public class func getImage(url: String)->Task<NSData?>
    {
        let tcs = TaskCompletionSource<NSData?>()
        
        let queue = dispatch_queue_create("rss.image.queue", DISPATCH_QUEUE_CONCURRENT)
        dispatch_async(queue){
        
            let data = NSData(contentsOfURL: NSURL(string: url)!)
            dispatch_async(dispatch_get_main_queue())
            {
                
                tcs.set(result: data)
               
            }
        }
        
        return tcs.task
    }
}