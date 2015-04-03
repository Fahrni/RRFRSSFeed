//
//  RRFRSSItem.h
//  RRFRSSFeed
//
//  Created by Rob Fahrni on 8/2/14.
//  Copyright (c) 2014 Hayseed. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface RRFRSSItem : NSObject
// From the RSS 2.0 Item specification - http://cyber.law.harvard.edu/rss/rss.html#hrelementsOfLtitemgt
@property (nonatomic, readonly, copy) NSString* title;
@property (nonatomic, readonly, copy) NSString* link;
@property (nonatomic, readonly, copy) NSString* itemDescription;
@property (nonatomic, readonly, copy) NSString* author;
@property (nonatomic, readonly, copy) NSString* category;
@property (nonatomic, readonly, copy) NSString* comments;
@property (nonatomic, readonly, copy) NSString* enclosure;
@property (nonatomic, readonly, copy) NSString* guid;
@property (nonatomic, readonly, copy) NSString* pubDate;
@property (nonatomic, readonly, copy) NSString* source;

+ (instancetype)itemFrom:(id)itemElement;
@end
