//
//  RssParser.swift
//  MechanicReader
//
//  Created by Admin on 10.10.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import BoltsSwift

public class RssParser:NSObject, NSXMLParserDelegate
{
    private  let rssURL = "http://www.popmech.ru/out/public-all.xml"
    private var parser:NSXMLParser?
    
    var feed=[RssItem]()
    private var currentElement:RssItem?
    private var eName:String=""
    
   public override init() {
        self.parser = NSXMLParser()
   
        super.init()
     self.parser?.delegate = self 
    self.setParser()
    }
    private func setParser()
    {
       self.parser = NSXMLParser(contentsOfURL: NSURL(string: rssURL)!)
        self.parser?.delegate = self
    }
    public func parse()->Task<Bool>
    {
        let tcs = TaskCompletionSource<Bool>()
        let queue = dispatch_queue_create("rss.parser", DISPATCH_QUEUE_CONCURRENT)
        dispatch_async(queue){
        if let success = self.parser?.parse()
        {
            dispatch_async(dispatch_get_main_queue())
            {
            tcs.set(result: success)
            }
            
            
        
        }
        else
        {
            dispatch_async(dispatch_get_main_queue())
            {
                tcs.set(result: false)
            }
        }
        }
    
        return tcs.task
    }
    
    
    public func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        self.eName = elementName
        
        if eName == "item"
        {
            self.currentElement = RssItem()
        }
        else {
            if eName == "enclosure"
            {
                if let url = attributeDict["url"]
                {
                self.currentElement?.imageUrl = url
                }
            }
        }
    }
    public func parser(parser: NSXMLParser, foundCharacters string: String) {
        let data = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        if !data.isEmpty
        {
            if eName == "title"
            {
                self.currentElement?.title += data
            }
            else
                if eName == "link"
                {
                    self.currentElement?.link += data
                }
                    
                else if eName == "pubDate"
                {
                    self.currentElement?.pubDate += data
            }
            
        }
    }
    public func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item"
        {
            if let el = self.currentElement
            {
                self.feed.append(el)
            }
        }
    }
}