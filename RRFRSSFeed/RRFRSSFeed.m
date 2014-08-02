//
//  RRFRSSFeed.m
//  RRFRSSFeed
//
//  Created by Rob Fahrni on 8/2/14.
//  Copyright (c) 2014 Hayseed. All rights reserved.
//
#import "RRFRSSConst.h"
#import "RRFRSSFeed.h"
#import "RRFRSSItem.h"
#import "TouchXML.h"

NSString* const kRRFRSSChannelPath = @"/rss/channel";
NSString* const kRRFRSSChannelItemPath = @"/rss/channel/item";

@interface RRFRSSFeed ()
@property (strong, nonatomic) NSURL* rrfURL;
@property (strong, nonatomic) CXMLDocument* rssParser;

@property (strong, nonatomic) NSMutableArray* rssItems;
@end

@implementation RRFRSSFeed
@synthesize version;
@synthesize channel;
@synthesize items;

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

- (NSArray*)items
{
    return self.rssItems;
}

- (void)update:(RRFRSSFeedSuccessBlock)success
       failure:(RRFRSSFailureBlock)failure;
{
    // Create a GCD queue to download and parse the update.
    dispatch_queue_t updateQueue = dispatch_queue_create(kRRFRSSUpdateQueue, NULL);
    dispatch_async(updateQueue, ^{
        NSError* error = nil;
        self.rssParser = [[CXMLDocument alloc] initWithContentsOfURL:self.rrfURL options:0  error:&error];
        if (nil == error && self.rssParser) {
            [self rssParseBasic];
            [self rssParseChannel];
            [self rssParseItems];
            if (success) {
                success(self);
            }
        } else if (failure) {
            if (nil == error) {
                error = [NSError errorWithDomain:kRRFRSSErrorDomain code:kRRFRSSInitFailed userInfo:nil];
            }
            failure(error);
        }
    });
}

- (NSError*)rssParseBasic
{
    NSError* error = nil;
    id rss = [[self.rssParser rootElement] nodeForXPath:kRRFRSSRoot error:&error];
    if ([rss isKindOfClass:[CXMLElement class]]) {
        CXMLNode* versionNode = [((CXMLElement*)rss) attributeForName:kRRFRSSVersion];
        self.version = versionNode.stringValue;
    }
    return error;
}

- (NSError*)rssParseChannel
{
    NSError* error = nil;
    id channelElement = [[self.rssParser rootElement] nodeForXPath:kRRFRSSChannelPath error:&error];
    if ([channelElement isKindOfClass:[CXMLElement class]]) {
        self.channel = [RRFRSSChannel channelFrom:channelElement];
    }
    return error;
}

- (NSError*)rssParseItems
{
    NSError* error = nil;
    NSArray* nodes = [[self.rssParser rootElement] nodesForXPath:kRRFRSSChannelItemPath error:&error];
    if (nodes && nodes.count) {
        self.rssItems = [NSMutableArray new];
        for (CXMLNode* item in nodes) {
            if (NSOrderedSame == [item.name compare:kRRFRSSItem]) {
                RRFRSSItem* rssItem = [RRFRSSItem itemFrom:item];
                if (item) {
                    [self.rssItems addObject:rssItem];
                }
            }
        }
    }
    return error;
}

@end
