//
//  PlayingCard.h
//  CardMatchGame
//
//  Created by 1 on 15.10.16.
//  Copyright © 2016 1. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSInteger rank;
+(NSArray *)validSuits;
+(NSUInteger)maxRank;
@end
