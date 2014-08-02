//
//  RRFRSSFeed.m
//  RRFRSSFeed
//
//  Created by Rob Fahrni on 8/2/14.
//  Copyright (c) 2014 Hayseed. All rights reserved.
//
#import "RRFRSSConst.h"
#import "RRFRSSFeed.h"
#import "TouchXML.h"

@interface RRFRSSFeed ()
@property (strong, nonatomic) NSURL* rrfURL;
@end

@implementation RRFRSSFeed

+ (instancetype)feedWithURLString:(NSString*)urlString
{
    return [[RRFRSSFeed alloc] initWithURL:[NSURL URLWithString:urlString]];
}

+ (instancetype)feedWithURL:(NSURL*)url
{
    return [[RRFRSSFeed alloc] initWithURL:url];
}

- (id)initWithURL:(NSURL*)url
{
    if ((self = [super init])) {
        self.rrfURL = url;
    }
    return self;
}

- (void)update:(RRFRSSFeedSuccessBlock)success
       failure:(RRFRSSFailureBlock)failure;
{
    // Create a GCD queue to download and parse the update.
    dispatch_queue_t updateQueue = dispatch_queue_create(kRRFRSSUpdateQueue, NULL);
    dispatch_async(updateQueue, ^{
        NSError* error = nil;
        CXMLDocument* rssParser = [[CXMLDocument alloc] initWithContentsOfURL:self.rrfURL options:0  error:&error];
        if (nil == error && rssParser) {
//            NSArray* items = [rssParser nodesForXPath:kRRFRSSChannelElement error:nil];
        }

    });
}

@end
