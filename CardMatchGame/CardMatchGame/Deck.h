//
//  Deck.h
//  CardMatchGame
//
//  Created by 1 on 15.10.16.
//  Copyright © 2016 1. All rights reserved.
//

@import Foundation;
#import "Card.h"
@interface Deck : NSObject
-(void)addCard:(Card*) card;
-(void)addCard:(Card*) card atTop:(BOOL)atTop;
-(Card*)drawRandomCard;
@end
