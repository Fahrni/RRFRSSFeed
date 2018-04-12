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
@property (nonatomic, readonly, copy) NSString* _Nonnull title;
@property (nonatomic, readonly, copy) NSString* _Nonnull link;
@property (nonatomic, readonly, copy) NSString* _Nullable itemDescription;
@property (nonatomic, readonly, copy) NSString* _Nullable author;
@property (nonatomic, readonly, copy) NSString* _Nullable category;
@property (nonatomic, readonly, copy) NSString* _Nullable comments;
@property (nonatomic, readonly, copy) NSString* _Nullable enclosure;
@property (nonatomic, readonly, copy) NSString* _Nullable guid;
@property (nonatomic, readonly, copy) NSString* _Nullable pubDate;
@property (nonatomic, readonly, copy) NSString* _Nullable source;

+ (instancetype _Nullable)itemFrom:(id _Nonnull)itemElement;
@end
