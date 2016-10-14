//
//  RssCell.h
//  RssReaderObj
//
//  Created by Admin on 14.10.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RssItem.h"
@interface RssCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *feedImage;
-(void)setData:(RssItem *)item;
@end
