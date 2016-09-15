//
//  Messenger.swift
//  SwiftCore
//
//  Created by Admin on 15.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class Messenger:MessengerProtocol
{
    
    var api:ApiProtocol!
    
    init(api:ApiProtocol!)
    {
        self.api=api
    }
    
    
    func getImageByUrl(url:String,callback:(NSData!)->Void)

    {
        performTask({(urlString) in
            self.api.getImageByUrl(urlString!)
            
            }, callback: callback, model: url)
    }
    
    private func performTask<TModel,TResult>(task:(TModel?)->TResult,callback:(TResult)->Void,model:TModel?)
    {
        let queue=NSOperationQueue()
        let operation = NSBlockOperation(block: {
        let result = task(model)
            NSOperationQueue.mainQueue().addOperationWithBlock({ 
                callback(result)
            })
        })
        queue.addOperation(operation)
    }
}