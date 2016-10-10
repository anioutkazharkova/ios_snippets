//
//  RssItem.swift
//  MechanicReader
//
//  Created by Admin on 10.10.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

public class RssItem
{
    var title:String
    var link: String
    var pubDate:String
    var imageUrl:String
    var image:NSData?
    
  public  init()
    {
        self.title = ""
        self.link = ""
        self.pubDate = ""
        self.imageUrl=""
    }
}