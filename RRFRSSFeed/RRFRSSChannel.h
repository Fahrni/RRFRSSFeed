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
@property (nonatomic, readonly, copy) NSString* title;
@property (nonatomic, readonly, copy) NSString* link;
@property (nonatomic, readonly, copy) NSString* channelDescription;
// Optional RRS 2.0 Channel Elements (http://cyber.law.harvard.edu/rss/rss.html#optionalChannelElements)
@property (nonatomic, readonly, copy) NSString* language;
@property (nonatomic, readonly, copy) NSString* copyright;
@property (nonatomic, readonly, copy) NSString* managingEditor;
@property (nonatomic, readonly, copy) NSString* webMaster;
@property (nonatomic, readonly, copy) NSString* pubDate;
@property (nonatomic, readonly, copy) NSString* lastBuildDate;
@property (nonatomic, readonly, copy) NSString* category;
@property (nonatomic, readonly, copy) NSString* generator;
@property (nonatomic, readonly, copy) NSString* docs;
@property (nonatomic, readonly, copy) NSString* cloud;
@property (nonatomic, readonly, copy) NSString* ttl;
@property (nonatomic, readonly, copy) NSString* image;
@property (nonatomic, readonly, copy) NSString* rating;
@property (nonatomic, readonly, copy) NSString* textInput;
@property (nonatomic, readonly, copy) NSString* skipHours;
@property (nonatomic, readonly, copy) NSString* skipDays;

+ (instancetype)channelFrom:(id)channelElement;
@end
