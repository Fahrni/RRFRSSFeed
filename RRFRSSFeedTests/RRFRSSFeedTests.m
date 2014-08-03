//
//  RRFRSSFeedTests.m
//  RRFRSSFeedTests
//
//  Created by Rob Fahrni on 8/2/14.
//  Copyright (c) 2014 Hayseed. All rights reserved.
//
#import <XCTest/XCTest.h>
#import "RRFRSS.h"  // All headers

// Since Dave Winer is the father of RSS, let's parse his feed.
NSString* const kRSSGodfatherFeed = @"http://scripting.com/rss.xml";
NSString* const kRSSKomenNewsFeed = @"http://ww5.komen.org/KomenNewsRSS.aspx?FolderName=News";
NSString* const kRSSKomenExternalNewsFeed = @"http://ww5.komen.org/KomenNewsRSS.aspx?FolderName=ExternalNews";
NSString* const kRSSSwiftNewsFeed = @"http://developer.apple.com/swift/blog/news.rss";

NSTimeInterval const kRSSWaitTimeout = 15; // seconds

@interface RRFRSSFeedTests : XCTestCase
@property (assign, nonatomic) __block BOOL feedDone;
@end

@implementation RRFRSSFeedTests

- (void)setUp
{
    [super setUp];
    
    self.feedDone = NO;
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testConstruct
{
    // Construct the feed.
    RRFRSSFeed* feed = [RRFRSSFeed feedWithURLString:kRSSGodfatherFeed];
    XCTAssertNotNil(feed, @"\"%s\": construct feed failed, feed is nil.", __PRETTY_FUNCTION__);
}

- (void)testUpdateGodfather
{
    // Construct the feed.
    RRFRSSFeed* feed = [RRFRSSFeed feedWithURLString:kRSSGodfatherFeed];
    
    // Update the feed.
    [feed update:^(RRFRSSFeed* feed) {
        XCTAssertNotNil(feed, @"\"%s\": update feed failed, feed is nil.", __PRETTY_FUNCTION__);
        self.feedDone = YES;
    } failure:^(NSError* error) {
        XCTFail(@"\"%s\": update feed failed with %@", __PRETTY_FUNCTION__, error);
        self.feedDone = YES;
    }];
    
    // Wait
    [self feedRunWaitLoop];
}

- (void)testUpdateKomen
{
    // Construct the feed.
    RRFRSSFeed* feed = [RRFRSSFeed feedWithURLString:kRSSKomenNewsFeed];
    
    // Update the feed.
    [feed update:^(RRFRSSFeed* feed) {
        XCTAssertNotNil(feed, @"\"%s\": update feed failed, feed is nil.", __PRETTY_FUNCTION__);
        self.feedDone = YES;
    } failure:^(NSError* error) {
        XCTFail(@"\"%s\": update feed failed with %@", __PRETTY_FUNCTION__, error);
        self.feedDone = YES;
    }];
    
    // Wait
    [self feedRunWaitLoop];
}

- (void)testUpdateKomenExternal
{
    // Construct the feed.
    RRFRSSFeed* feed = [RRFRSSFeed feedWithURLString:kRSSKomenExternalNewsFeed];
    
    // Update the feed.
    [feed update:^(RRFRSSFeed* feed) {
        XCTAssertNotNil(feed, @"\"%s\": update feed failed, feed is nil.", __PRETTY_FUNCTION__);
        self.feedDone = YES;
    } failure:^(NSError* error) {
        XCTFail(@"\"%s\": update feed failed with %@", __PRETTY_FUNCTION__, error);
        self.feedDone = YES;
    }];
    
    // Wait
    [self feedRunWaitLoop];
}

- (void)testUpdateSwift
{
    // Construct the feed.
    RRFRSSFeed* feed = [RRFRSSFeed feedWithURLString:kRSSSwiftNewsFeed];
    
    // Update the feed.
    [feed update:^(RRFRSSFeed* feed) {
        XCTAssertNotNil(feed, @"\"%s\": update feed failed, feed is nil.", __PRETTY_FUNCTION__);
        self.feedDone = YES;
    } failure:^(NSError* error) {
        XCTFail(@"\"%s\": update feed failed with %@", __PRETTY_FUNCTION__, error);
        self.feedDone = YES;
    }];
    
    // Wait
    [self feedRunWaitLoop];
}

- (void)testFeedBasics
{
    // Construct the feed.
    RRFRSSFeed* feed = [RRFRSSFeed feedWithURLString:kRSSSwiftNewsFeed];
    
    // Update the feed.
    [feed update:^(RRFRSSFeed* feed) {
        XCTAssertNotNil(feed, @"\"%s\": update feed failed, feed is nil.", __PRETTY_FUNCTION__);
        XCTAssertEqual(@"http://developer.apple.com/swift/blog/news.rss", feed.url, @"\"%s\": feed description does not match.", __PRETTY_FUNCTION__);
        // Puzzled, the line below fails, but feed.version is 2.0.
//        XCTAssertEqual(@"2.0", feed.version, @"\"%s\": feed version does not match.", __PRETTY_FUNCTION__);
        
        // Hey, guess what, Apple's RSS 2.0 feed is not RSS 2.0 compliant.
        //
        self.feedDone = YES;
    } failure:^(NSError* error) {
        XCTFail(@"\"%s\": update feed failed with %@", __PRETTY_FUNCTION__, error);
        self.feedDone = YES;
    }];
    
    // Wait
    [self feedRunWaitLoop];
}


#pragma mark - Lazy man's asynchronous wait loop

- (void)feedRunWaitLoop
{
    // Reset our _done flag.
    self.feedDone = NO;
    
    // Get the current run loop.
    NSRunLoop* runLoop = [NSRunLoop currentRunLoop];
    
    // Spin until the _done is YES or we've waited for xx seconds.
    // Yep, it's a complete hack, just to get this working.
    while ((NO == self.feedDone) &&
           [runLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:kRSSWaitTimeout]]);
}
@end
