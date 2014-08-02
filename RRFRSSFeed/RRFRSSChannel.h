//
//  RRFRSSChannel.h
//  RRFRSSFeed
//
//  Created by Rob Fahrni on 8/2/14.
//  Copyright (c) 2014 Hayseed. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface RRFRSSChannel : NSObject
// Required RSS 2.0 Channel Elements (http://cyber.law.harvard.edu/rss/rss.html#requiredChannelElements)
@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* link;
@property (strong, nonatomic) NSString* description;
// Optional RRS 2.0 Channel Elements (http://cyber.law.harvard.edu/rss/rss.html#optionalChannelElements)
@property (strong, nonatomic) NSString* language;
@property (strong, nonatomic) NSString* copyright;
@property (strong, nonatomic) NSString* managingEditor;
@property (strong, nonatomic) NSString* webMaster;
@property (strong, nonatomic) NSString* pubDate;
@property (strong, nonatomic) NSString* lastBuildDate;
@property (strong, nonatomic) NSString* category;
@property (strong, nonatomic) NSString* generator;
@property (strong, nonatomic) NSString* docs;
@property (strong, nonatomic) NSString* cloud;
@property (strong, nonatomic) NSString* ttl;
@property (strong, nonatomic) NSString* image;
@property (strong, nonatomic) NSString* rating;
@property (strong, nonatomic) NSString* textInput;
@property (strong, nonatomic) NSString* skipHours;
@property (strong, nonatomic) NSString* skipDays;

+ (instancetype)channelFrom:(id)channelElement;
@end
