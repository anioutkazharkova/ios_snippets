//
//  ViewController.m
//  DbTest
//
//  Created by 1 on 29.10.16.
//  Copyright © 2016 1. All rights reserved.
//

#import "ViewController.h"
#import <Realm/Realm.h>
#import "SampleUser.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;

@end

@implementation ViewController
NSInteger _id=0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)writeClicked:(id)sender {
    dispatch_async(dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT),^{
    RLMRealm *realm = [RLMRealm defaultRealm];
    SampleUser *user = [[SampleUser alloc]init: self.nameField.text];
    //_id+=1;
    user.id =[self getKey];
     [realm beginWriteTransaction];
    [realm addObject:user];
    [realm commitWriteTransaction];
    });
}
- (IBAction)readClicked:(id)sender {
    RLMResults *results = [SampleUser allObjects];
    for(RLMObject *object in results)
    {
        SampleUser *user = (SampleUser *)object;
        if (user)
        NSLog(@"%@",user.name);
    }
}
-(NSInteger)getKey
{
     RLMResults *results = [SampleUser allObjects];
   return ((SampleUser *)results[[results count]-1 ]).id+1;
}




@end
