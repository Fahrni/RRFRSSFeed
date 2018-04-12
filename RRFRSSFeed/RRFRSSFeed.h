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
@property (nonatomic, readonly, copy) NSString* _Nonnull version;
@property (nonatomic, readonly, copy) NSString* _Nonnull url;
@property (nonatomic, readonly) RRFRSSChannel* _Nullable channel;
@property (nonatomic, readonly, copy) NSArray* _Nullable items;

+ (instancetype _Nullable)feedWithURLString:(NSString* _Nonnull)urlString;
+ (instancetype _Nullable)feedWithURL:(NSURL* _Nonnull)url;

- (instancetype _Nullable)initWithURL:(NSURL* _Nonnull)url;

- (void)update:(RRFRSSFeedSuccessBlock _Nonnull)success
       failure:(RRFRSSFailureBlock _Nonnull)failure;

@end
