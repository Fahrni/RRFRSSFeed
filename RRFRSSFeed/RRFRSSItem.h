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
@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* link;
@property (strong, nonatomic) NSString* description;
@property (strong, nonatomic) NSString* author;
@property (strong, nonatomic) NSString* category;
@property (strong, nonatomic) NSString* comments;
@property (strong, nonatomic) NSString* enclosure;
@property (strong, nonatomic) NSString* guid;
@property (strong, nonatomic) NSString* pubDate;
@property (strong, nonatomic) NSString* source;

+ (instancetype)itemFrom:(id)itemElement;
@end
