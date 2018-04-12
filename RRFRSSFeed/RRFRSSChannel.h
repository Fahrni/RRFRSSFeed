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
@property (nonatomic, readonly, copy) NSString* _Nonnull title;
@property (nonatomic, readonly, copy) NSString* _Nonnull link;
@property (nonatomic, readonly, copy) NSString* _Nonnull channelDescription;
// Optional RRS 2.0 Channel Elements (http://cyber.law.harvard.edu/rss/rss.html#optionalChannelElements)
@property (nonatomic, readonly, copy) NSString* _Nullable language;
@property (nonatomic, readonly, copy) NSString* _Nullable copyright;
@property (nonatomic, readonly, copy) NSString* _Nullable managingEditor;
@property (nonatomic, readonly, copy) NSString* _Nullable webMaster;
@property (nonatomic, readonly, copy) NSString* _Nullable pubDate;
@property (nonatomic, readonly, copy) NSString* _Nullable lastBuildDate;
@property (nonatomic, readonly, copy) NSString* _Nullable category;
@property (nonatomic, readonly, copy) NSString* _Nullable generator;
@property (nonatomic, readonly, copy) NSString* _Nullable docs;
@property (nonatomic, readonly, copy) NSString* _Nullable cloud;
@property (nonatomic, readonly, copy) NSString* _Nullable ttl;
@property (nonatomic, readonly, copy) NSString* _Nullable image;
@property (nonatomic, readonly, copy) NSString* _Nullable rating;
@property (nonatomic, readonly, copy) NSString* _Nullable textInput;
@property (nonatomic, readonly, copy) NSString* _Nullable skipHours;
@property (nonatomic, readonly, copy) NSString* _Nullable skipDays;

+ (instancetype _Nullable)channelFrom:(id _Nonnull)channelElement;
@end
