//
//  SampleUser.m
//  DbTest
//
//  Created by 1 on 29.10.16.
//  Copyright © 2016 1. All rights reserved.
//

#import "SampleUser.h"

@implementation SampleUser
static NSInteger ind=0;
+(NSString *)primaryKey
{
    return @"id";
}
-(instancetype)init:(NSString *)name
{
    ind+=1;
    self=[super init];
    self.id= ind;
    self.name = [name copy];
    return self;
}

@end
