//
//  RRFRSSFeed.m
//  RRFRSSFeed
//
//  Created by Rob Fahrni on 8/2/14.
//  Copyright (c) 2014 Hayseed. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "RRFRSSConst.h"
#import "RRFRSSFeed.h"
#import "RRFRSSItem.h"
#import "TouchXML.h"

NSString* const kRRFRSSChannelPath = @"/rss/channel";
NSString* const kRRFRSSChannelItemPath = @"/rss/channel/item";

@interface RRFRSSFeed ()
@property (nonatomic, readwrite, copy) NSString* version;
@property (nonatomic, readwrite, copy) NSString* url;
@property (nonatomic, readwrite) RRFRSSChannel* _Nullable channel;
@property (nonatomic, readwrite, copy) NSArray* _Nullable items;

#pragma mark Internal Properties
@property (nonatomic, strong) NSURL* rrfURL;
@property (nonatomic, strong) NSData* rrfData;
@property (nonatomic, strong) CXMLDocument* rssParser;
@property (nonatomic, strong) NSMutableArray<RRFRSSItem*>* rssItems;
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

- (instancetype)initWithURL:(NSURL*)url
{
    if ((self = [super init])) {
        self.rrfURL = url;
        self.rrfData = nil;
    }
    return self;
}

- (instancetype _Nullable)initWithData:(NSData* _Nonnull)data {
    if ((self = [super init])) {
        self.rrfData = data;
        self.rrfURL = nil;
    }
    return self;

}

- (NSString* _Nonnull)description
{
    return [NSString stringWithFormat:@"<RRFRSSFeed version: %@, url: %@", self.version, self.url];
}

- (NSString* _Nonnull)version
{
    return @"1.1.0";
}

- (NSString* _Nonnull)url
{
    if (self.rrfURL == nil) { return self.channel.link; }
    return self.rrfURL.absoluteString;
}

- (NSArray<RRFRSSItem*>* _Nullable)items
{
    return self.rssItems;
}

- (void)update:(RRFRSSFeedCompletionBlock _Nonnull)completion
{
    // Create a GCD queue to download and parse the update.
    dispatch_queue_t updateQueue = dispatch_queue_create(kRRFRSSUpdateQueue, NULL);
    dispatch_async(updateQueue, ^{
        NSError* error = nil;
        if (self.rrfURL == nil) {
            self.rssParser = [[CXMLDocument alloc] initWithData:self.rrfData options:0 error:&error];
        } else {
            self.rssParser = [[CXMLDocument alloc] initWithContentsOfURL:self.rrfURL options:0 error:&error];
        }
        if (nil == error && self.rssParser) {
            [self rssParseBasic];
            [self rssParseChannel];
            [self rssParseItems];
            if (completion) {
                completion(self, nil);
            }
        } else if (completion && error) {
            completion(nil, error);
        }
    });
}

- (NSError* _Nullable)rssParseBasic
{
    NSError* error = nil;
    id rss = [[self.rssParser rootElement] nodeForXPath:kRRFRSSRoot error:&error];
    if ([rss isKindOfClass:[CXMLElement class]]) {
        CXMLNode* versionNode = [((CXMLElement*)rss) attributeForName:kRRFRSSVersion];
        self.version = versionNode.stringValue;
    }
    return error;
}

- (NSError* _Nullable)rssParseChannel
{
    NSError* error = nil;
    id channelElement = [[self.rssParser rootElement] nodeForXPath:kRRFRSSChannelPath error:&error];
    if ([channelElement isKindOfClass:[CXMLElement class]]) {
        self.channel = [RRFRSSChannel channelFrom:channelElement];
    }
    return error;
}

- (NSError* _Nullable)rssParseItems
{
    NSError* error = nil;
    NSArray* nodes = [[self.rssParser rootElement] nodesForXPath:kRRFRSSChannelItemPath error:&error];
    if (nodes && nodes.count) {
        self.rssItems = [NSMutableArray new];
        for (CXMLNode* item in nodes) {
            if (NSOrderedSame == [item.name compare:kRRFRSSItem]) {
                RRFRSSItem* rssItem = [RRFRSSItem itemFrom:item];
                if (rssItem) {
                    [self.rssItems addObject:rssItem];
                }
            }
        }
    }
    return error;
}

@end
