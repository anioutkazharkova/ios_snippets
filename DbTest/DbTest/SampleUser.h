//
//  SampleUser.h
//  DbTest
//
//  Created by 1 on 29.10.16.
//  Copyright © 2016 1. All rights reserved.
//

#import <Realm/RLMObject.h>

@interface SampleUser : RLMObject
@property NSInteger id;
@property NSString *name;
-(instancetype)init:(NSString *)name;
@end
