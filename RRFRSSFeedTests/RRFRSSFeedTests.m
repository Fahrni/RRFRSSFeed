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
NSString* const kRSSSwiftNewsFeed = @"http://developer.apple.com/swift/blog/news.rss";
NSString* const kRSSRobsFeed = @"https://iam.fahrni.me/feed";
NSString* const kRSSBogusFeed = @"http://jobs.coreint.org/rss.xml";

NSTimeInterval const kRSSWaitTimeout = 15; // seconds

@interface RRFRSSFeedTests : XCTestCase
@end

@implementation RRFRSSFeedTests

- (void)setUp
{
    [super setUp];
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
    XCTestExpectation *expectation = [self expectationWithDescription:@"Update Godfather"];

    RRFRSSFeed* feed = [RRFRSSFeed feedWithURLString:kRSSGodfatherFeed];
    [feed update:^(RRFRSSFeed* feed, NSError* error) {
        XCTAssertNil(error, @"\"%s\": update feed failed, error is NOT nil.", __PRETTY_FUNCTION__);
        XCTAssertNotNil(feed, @"\"%s\": update feed failed, feed is nil.", __PRETTY_FUNCTION__);
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:kRSSWaitTimeout handler:nil];
}

- (void)testUpdateSwift
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Update Swift"];

    RRFRSSFeed* feed = [RRFRSSFeed feedWithURLString:kRSSSwiftNewsFeed];
    [feed update:^(RRFRSSFeed* feed, NSError* error) {
        XCTAssertNil(error, @"\"%s\": update feed failed, error is NOT nil.", __PRETTY_FUNCTION__);
        XCTAssertNotNil(feed, @"\"%s\": update feed failed, feed is nil.", __PRETTY_FUNCTION__);
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:kRSSWaitTimeout handler:nil];
}

- (void)testRobsFeed
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Update Rob"];

    RRFRSSFeed* feed = [RRFRSSFeed feedWithURLString:kRSSRobsFeed];
    [feed update:^(RRFRSSFeed* feed, NSError* error) {
        XCTAssertNil(error, @"\"%s\": update feed failed, error is NOT nil.", __PRETTY_FUNCTION__);
        XCTAssertNotNil(feed, @"\"%s\": update feed failed, feed is nil.", __PRETTY_FUNCTION__);
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:kRSSWaitTimeout handler:nil];
}

- (void)testFeedBasics
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Update Feed Basics"];

    RRFRSSFeed* feed = [RRFRSSFeed feedWithURLString:kRSSSwiftNewsFeed];
    [feed update:^(RRFRSSFeed* feed, NSError* error) {
        XCTAssertNil(error, @"\"%s\": update feed failed, error is NOT nil.", __PRETTY_FUNCTION__);
        XCTAssertNotNil(feed, @"\"%s\": update feed failed, feed is nil.", __PRETTY_FUNCTION__);
        XCTAssertEqual(@"http://developer.apple.com/swift/blog/news.rss", feed.url, @"\"%s\": feed description does not match.", __PRETTY_FUNCTION__);
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:kRSSWaitTimeout handler:nil];
}

- (void)testBogusFeed
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Update Bogus Feed"];

    RRFRSSFeed* feed = [RRFRSSFeed feedWithURLString:kRSSBogusFeed];
    [feed update:^(RRFRSSFeed* feed, NSError* error) {
        XCTAssertNotNil(error, @"\"%s\": update feed failed, error is nil, should have failed.", __PRETTY_FUNCTION__);
        XCTAssertNil(feed, @"\"%s\": update feed failed, feed is NOT nil.", __PRETTY_FUNCTION__);
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:kRSSWaitTimeout handler:nil];
}

@end
