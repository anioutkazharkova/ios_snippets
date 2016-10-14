//
//  RssCell.m
//  RssReaderObj
//
//  Created by Admin on 14.10.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "RssCell.h"

@implementation RssCell
-(void)setData:(RssItem *)item
{
    if (item != NULL)
    {
        self.titleLabel.text = item.title;
        self.dateLabel.text = item.pubDate;
        
        if (item.imageData != NULL)
        {
            [self.feedImage setImage:[UIImage imageWithData:item.imageData]];
        }
    }
}
@end
