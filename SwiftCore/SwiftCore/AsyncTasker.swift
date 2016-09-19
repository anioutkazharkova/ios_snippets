//
//  AsyncTasker.swift
//  SwiftCore
//
//  Created by Admin on 16.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation


class AsyncTasker<TMessage:MessageProtocol>
{
    private var queue=NSOperationQueue()
    
    func performAction(task: Task<TMessage>, callback: CallbackTask<TMessage>)
    {
        let operation = NSBlockOperation(block: {
       let result =  task.performAction()
            NSOperationQueue.mainQueue().addOperationWithBlock({
            
            callback.performAction(result)
            })
        
       
        
        })
        self.queue.addOperation(operation)
    }
    func cancel()
    {
        self.queue.cancelAllOperations()
    }

}
        