//
//  RssItem.m
//  RssReaderObj
//
//  Created by Admin on 11.10.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "RssItem.h"

@implementation RssItem
-(instancetype)init
{
    _title = [NSMutableString stringWithString:@""];
    _imageUrl = [NSMutableString stringWithString:@""];
    _link = [NSMutableString stringWithString:@""];

    _pubDate = [NSMutableString stringWithString:@""];

    return self;
}
-(void)print
{
    NSLog(@"%@ %@ %@ %@",_title,_imageUrl,_link,_pubDate);
}
-(RssItem*)createcopy
{
    RssItem *newItem=[[RssItem alloc] init];
    newItem.title = [self.title copy];
    newItem.link = [self.link copy];
    newItem.pubDate = [self.pubDate copy];
    newItem.imageUrl = [self.imageUrl copy];
    newItem.imageData = [self.imageData copy];
    return newItem;
}
@end
