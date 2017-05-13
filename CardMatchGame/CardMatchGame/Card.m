//
//  Card.m
//  CardMatchGame
//
//  Created by 1 on 15.10.16.
//  Copyright © 2016 1. All rights reserved.
//

#import "Card.h"
@interface Card()

@end

@implementation Card
-(BOOL)isChosen
{
    return _chosen;
}
-(BOOL)isMatched
{
    return  _matched;
}

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    for (Card *card in otherCards)
    {
    if ([card.contents isEqualToString:self.contents])
    {
        score = 1;
    }
    }
    return score;
}
@end
