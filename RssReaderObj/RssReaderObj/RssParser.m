//
//  RssParser.m
//  RssReaderObj
//
//  Created by Admin on 11.10.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "RssParser.h"
#import "RssItem.h"

@implementation RssParser
NSString *rssUrl = @"http://www.popmech.ru/out/public-all.xml";
NSMutableString *eName;

RssItem *currentItem;

-(instancetype)init
{
    self = [super init];
    if (self)
    {
       
        self.feeds = [NSMutableArray arrayWithCapacity:1];
        self.parser = [[NSXMLParser alloc]initWithContentsOfURL:[NSURL URLWithString:rssUrl ]];
        self.parser.delegate = self;
    }
    return self;
}
-(BFTask *)parse
{
    BFTaskCompletionSource *tsc = [BFTaskCompletionSource taskCompletionSource];
    BOOL success = [self.parser parse];
    if (success)
    {
        //if (_delegate != NULL)
        //{
            //[_delegate setParsedData:_feeds];
            [tsc setResult:_feeds];
       // }
        for (RssItem *f in _feeds)
        {
            [f print];
        }
    }
    else
    {  [tsc setResult:nil];
    }    return tsc.task;
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{

    eName = [NSMutableString stringWithString:elementName];
    if ([elementName  isEqual: @"item"])
    {
        currentItem = [[RssItem alloc]init];
    }
    else
    {
        if ([elementName  isEqual: @"enclosure"])
        {
            [currentItem.imageUrl appendString:[NSMutableString stringWithString: attributeDict[@"url"]]];
        }
    }
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    NSString *data = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (![data isEqual:@""])
    {
    if (currentItem != nil)
    {
    if ([eName isEqual:@"title"])
    {
        [currentItem.title appendString:[data copy]];
    }
    else
        if ([eName isEqual:@"pubDate"])
        {
           [currentItem.pubDate appendString:[data copy]];
        }
    else
        if ([eName isEqual:@"link"])
        {
           [currentItem.link appendString:[data copy]];
        }
    }
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqual:@"item"])
    {
        if (currentItem != nil)
        {
        [self.feeds addObject:[currentItem  createcopy]];
        }
    }
}

@end
