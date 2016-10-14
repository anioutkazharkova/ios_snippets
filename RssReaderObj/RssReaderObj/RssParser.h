//
//  RssParser.h
//  RssReaderObj
//
//  Created by Admin on 11.10.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParserDelegateProtocol.h"
#import <Bolts/BFTask.h>
#import <Bolts/BFTaskCompletionSource.h>
@interface RssParser : NSObject<NSXMLParserDelegate>
@property (nonatomic) NSXMLParser *parser;
@property (nonatomic) NSMutableArray *feeds;
@property (nonatomic) id<ParserDelegate> delegate;
-(BFTask *)parse;

@end
