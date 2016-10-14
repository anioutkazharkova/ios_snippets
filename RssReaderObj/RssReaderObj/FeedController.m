//
//  FeedController.m
//  RssReaderObj
//
//  Created by Admin on 14.10.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "FeedController.h"
#import "ImageDownloader.h"
@implementation FeedController
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setBackButton];
    [self.titleLabel setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8]];
    [self.dateLabel setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8]];

    [self.linkButton setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8]];
    if (_currentItem != NULL)
    {
        self.titleLabel.text = _currentItem.title;
        self.dateLabel.text = _currentItem.pubDate;
        if (_currentItem.imageData == NULL)
        {
            [[ImageDownloader downloadImageByUrl:_currentItem.imageUrl] continueWithBlock:^id(BFTask *task){
                if (task.error != NULL)
                {
                    
                }
                else
                {
                    [self setImage:task.result];
                }
                return  nil;
            }];
        }
        else
        {
            [self.feedImage setImage:[UIImage imageWithData:_currentItem.imageData]];
        }
    }
}

-(void)setBackButton
{
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonPressed)];
    [self.navigationItem setLeftBarButtonItem:leftButton];
}
-(void)backButtonPressed
{
    [self.navigationController popViewControllerAnimated:false];
}
-(void) setImage:(NSData*)data
{
    if (data != NULL)
    {
        [self.feedImage setImage: [UIImage imageWithData:data]];
    }
}
- (IBAction)goByUrlClicked:(id)sender {
    NSURL *link = [NSURL URLWithString:_currentItem.link];
    if ([[UIApplication sharedApplication] canOpenURL:link])
    {
        [[UIApplication sharedApplication] openURL:link];
    }
}

@end
