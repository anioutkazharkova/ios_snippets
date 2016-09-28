//
//  DataProviderSampleExtension.swift
//  SwiftCore
//
//  Created by Admin on 28.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import BoltsSwift

extension DataProvider
{
    
    //Sample method
    public func getImageByUrl(data:ImageModel)->Task<ImageModel>
    {
        var isStored=false
        let tcs = TaskCompletionSource<ImageModel>()
        if let result = self.cacheProvider?.getImage(data.imageUrl!)
        {
            if let d = result.data
            {
                print ("id:\(result.id)")
                isStored=true
                data.imageData = d
                tcs.set(result: data)
            }
        }
        if (!isStored)
        {
            self.apiClient?.getImageByUrl(data.imageUrl!).continueWith(continuation: {
                task in
                if  let result = task.result
                {
                    let im = ImageTable()
                    im.data = result
                    im.url = data.imageUrl
                    self.cacheProvider?.saveImage(im)
                    data.imageData = result
                    tcs.set(result: data)
                }
            })
        }
        
        
        return tcs.task
    }

}