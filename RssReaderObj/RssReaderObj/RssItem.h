//
//  RssItem.h
//  RssReaderObj
//
//  Created by Admin on 11.10.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RssItem : NSObject
@property (nonatomic,copy) NSMutableString *title;
@property (nonatomic,copy) NSMutableString *link;
@property (nonatomic,copy) NSMutableString *pubDate;
@property (nonatomic,copy) NSMutableString *imageUrl;
@property (nonatomic,copy) NSMutableData *imageData;
-(RssItem *)createcopy;
-(void)print;
@end
