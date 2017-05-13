//
//  CardMatchingGame.h
//  CardMatchGame
//
//  Created by 1 on 16.10.16.
//  Copyright © 2016 1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
@interface CardMatchingGame : NSObject
//designated initializer
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic,readonly) NSInteger score;

@end
