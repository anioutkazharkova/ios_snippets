//
//  CardViewController.m
//  CardMatchGame
//
//  Created by 1 on 15.10.16.
//  Copyright © 2016 1. All rights reserved.
//

#import "CardViewController.h"
#import "Card.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardViewController ()
@property (nonatomic,strong) CardMatchingGame *game;
@property (nonatomic) Deck *playingDeck;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic) int scoreCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;



@end

@implementation CardViewController
-(CardMatchingGame *)game
{
    if (!_game)
    {
        _game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
        
    }
    return _game;
}
-(Deck *)playingDeck
{
    if (!_playingDeck)
    {
        _playingDeck = [self createDeck];
    }
    return _playingDeck;
}
-(Deck *)createDeck
{
   return [[PlayingCardDeck alloc] init];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    
    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}
-(void)updateUI
{
    for (UIButton *cardButton in self.cardButtons)
    {
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    [self setScoreCount:self.game.score];
}
-(NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}
-(UIImage *)backgroundImageForCard:(Card *)card
{
    return card.isChosen ? [UIImage imageNamed:@"cardfront"] : [UIImage imageNamed:@"cardback"];
}
-(void)setScoreCount:(int)scoreCount
{
    _scoreCount = scoreCount;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i",_scoreCount];
}
- (IBAction)dealGame:(id)sender {
   
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@""
                                                                             message:@"Do you want to restart a game?"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self restartGame];
    }];
    [alertController addAction:actionOk];
    [self presentViewController:alertController animated:YES completion:nil];
}
-(void)restartGame
{
    self.game = nil;
    [self updateUI];
}

@end
