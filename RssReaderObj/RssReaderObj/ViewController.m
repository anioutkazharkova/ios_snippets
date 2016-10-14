//
//  ViewController.m
//  RssReaderObj
//
//  Created by Admin on 11.10.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"
#import "RssCell.h"
#import "RssItem.h"
#import "ParserDelegateProtocol.h"
#import "FeedController.h"
#import "ImageDownloader.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,ParserDelegate>
@property (weak, nonatomic) IBOutlet UITableView *feedTable;

@end

@implementation ViewController
NSMutableArray *feeds;

- (void)viewDidLoad {
    [super viewDidLoad];

   
    feeds = [NSMutableArray arrayWithCapacity:1];
    
    self.feedTable.dataSource = self;
    self.feedTable.delegate = self;
    self.parser = [[RssParser alloc]init];
    //self.parser.delegate = self;
    [[self.parser parse] continueWithBlock:^id(BFTask *task){
        [self setParsedData:task.result];
        return  nil;
    }];
}

-(void) setParsedData:(NSArray *)items
{
    [feeds removeAllObjects];
    if (items != NULL)
    {
    [feeds addObjectsFromArray:items];
        [_feedTable reloadData];
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return feeds.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return  0.00001;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RssCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RssCell" forIndexPath:indexPath];
    RssItem *item = feeds[indexPath.row];
    if (item.imageData == NULL)
    {
        [[ImageDownloader downloadImageByUrl:item.imageUrl] continueWithBlock:^id(BFTask *task){
        if (task.error != NULL)
        {
            
        }
            else
                if (task.result != NULL)
                {
                    item.imageData = [NSMutableData dataWithData:task.result];
                    [self.feedTable reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];                }
            
            return nil;
        }];
    }
    [cell setData:item];
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RssCell *currentCell = (RssCell*)sender;
    if ([[segue identifier] isEqual:@"ShowFeed"])
    {
        FeedController* dc = ((FeedController*)[segue destinationViewController]);
        NSIndexPath *indexPath =[_feedTable indexPathForCell:currentCell];
        dc.currentItem = feeds[indexPath.row];
    }
}
@end
