//
//  ImageDownloader.m
//  RssReaderObj
//
//  Created by Admin on 14.10.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ImageDownloader.h"

@implementation ImageDownloader

+(BFTask *)downloadImageByUrl:(NSString*)imagePath
 {
     BFTaskCompletionSource *tcs = [BFTaskCompletionSource taskCompletionSource];
 NSURL *url = [NSURL URLWithString:imagePath];
 NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){
 if (error != NULL)
 {
     [tcs setError:error];
 return;
 }
 
 dispatch_async(dispatch_get_main_queue(), ^{[tcs setResult:data];});
 
 
 }];
 dispatch_queue_t queue = dispatch_queue_create("rss.queue", DISPATCH_QUEUE_CONCURRENT);
 dispatch_async(queue, ^{[task resume];});
     return tcs.task;
 }
@end
