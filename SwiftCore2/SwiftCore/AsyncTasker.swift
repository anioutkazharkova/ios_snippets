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
    private var isCanceled:Bool=false
    
    func performAction(task: Action<TMessage>, callback: CallbackAction<TMessage>)
    {
      let  operation = NSBlockOperation(block: {
      let  result =  task.performAction()
            
            NSOperationQueue.mainQueue().addOperationWithBlock({
                        if (self.isCanceled)
            {
                if var m = task.initialMessage
                {
                    m.isCanceled=true
                callback.performAction(m)
                }
                }
                else
            {
                callback.performAction(result)
                }
            }
            )
        
        })
        
        
        self.queue.addOperation(operation)
    }
    func cancelTask() {
        cancel()
    }
    func cancel()
    {isCanceled=true
        print("cancel")
        self.queue.cancelAllOperations()
    }
    deinit
    {
        self.queue.cancelAllOperations()
    }

}
        