//
//  MessengerSampleExtension.swift
//  SwiftCore
//
//  Created by Admin on 28.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import BoltsSwift

extension Messenger
{
    //Sample method to download image by url
    func processGetImage(message: GetImageMessage)->Task<GetImageMessage>
    {
        let tcs = TaskCompletionSource<GetImageMessage>()
        
        self.dataProvider?.getImageByUrl(message.content!).continueWith(continuation: {
            task in
            if let result = task.result
            {
                message.content?.imageData = result.imageData
                tcs.set(result: message)
            }
        })
        return tcs.task
    }
}