//
//  ImageDownloader.h
//  RssReaderObj
//
//  Created by Admin on 14.10.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Bolts/BFTask.h>
#import <Bolts/BFTaskCompletionSource.h>
@interface ImageDownloader : NSObject

+(BFTask *)downloadImageByUrl:(NSString*)url;
@end
