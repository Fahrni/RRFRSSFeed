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
@property (strong, nonatomic) NSString* version;
@property (strong, nonatomic) RRFRSSChannel* channel;
@property (strong, nonatomic) NSArray* items;

+ (instancetype)feedWithURLString:(NSString*)urlString;
+ (instancetype)feedWithURL:(NSURL*)url;

- (id)initWithURL:(NSURL*)url;

- (void)update:(RRFRSSFeedSuccessBlock)success
       failure:(RRFRSSFailureBlock)failure;

@end
