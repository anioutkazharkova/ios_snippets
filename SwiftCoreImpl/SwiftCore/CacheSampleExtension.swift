//
//  CacheSampleExtension.swift
//  SwiftCore
//
//  Created by Admin on 28.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

extension CacheProvider
{
    public func saveImage(image: ImageTable) {
        let rep = Repository<ImageTable>.create()
        rep.save(image)
    }
    public   func  getImage(url: String) -> ImageTable?{
        let rep = Repository<ImageTable>.create()
        let results = rep.getFiltered(NSPredicate(format: "url == %@", url))
        
        
        return results.count>0 ? results.first : nil
        
    }
}