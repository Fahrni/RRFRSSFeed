//
//  RRFRSSFeed.h
//  RRFRSSFeed
//
//  Created by Rob Fahrni on 8/2/14.
//  Copyright (c) 2014 Hayseed. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "RRFRSSFeedTypes.h"
#import "RRFRSSChannel.h"

@interface RRFRSSFeed : NSObject
@property (nonatomic, readonly, copy) NSString* version;
@property (nonatomic, readonly, copy) NSString* url;
@property (nonatomic, readonly) RRFRSSChannel* channel;
@property (nonatomic, readonly, copy) NSArray* items;

+ (instancetype)feedWithURLString:(NSString*)urlString;
+ (instancetype)feedWithURL:(NSURL*)url;

- (id)initWithURL:(NSURL*)url;

- (void)update:(RRFRSSFeedSuccessBlock)success
       failure:(RRFRSSFailureBlock)failure;

@end
