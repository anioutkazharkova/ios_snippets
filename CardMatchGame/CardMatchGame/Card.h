//
//  Card.h
//  CardMatchGame
//
//  Created by 1 on 15.10.16.
//  Copyright © 2016 1. All rights reserved.
//

@import Foundation;

@interface Card : NSObject
@property (nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

-(int)match:(NSArray*)otherCards;
@end
