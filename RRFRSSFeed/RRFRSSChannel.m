//
//  RRFRSSChannel.m
//  RRFRSSFeed
//
//  Created by Rob Fahrni on 8/2/14.
//  Copyright (c) 2014 Hayseed. All rights reserved.
//
#import "RRFRSSChannel.h"
#import "RRFRSSConst.h"
#import "CXMLElement.h"

@implementation RRFRSSChannel
// Required RSS 2.0 Channel Elements (http://cyber.law.harvard.edu/rss/rss.html#requiredChannelElements)
@synthesize title;
@synthesize link;
@synthesize description;
// Optional RRS 2.0 Channel Elements (http://cyber.law.harvard.edu/rss/rss.html#optionalChannelElements)
@synthesize language;
@synthesize copyright;
@synthesize managingEditor;
@synthesize webMaster;
@synthesize pubDate;
@synthesize lastBuildDate;
@synthesize category;
@synthesize generator;
@synthesize docs;
@synthesize cloud;
@synthesize ttl;
@synthesize image;
@synthesize rating;
@synthesize textInput;
@synthesize skipHours;
@synthesize skipDays;

+ (instancetype)channelFrom:(id)channelElement
{
    RRFRSSChannel* channel = [RRFRSSChannel new];
    for (CXMLNode* childNode in ((CXMLElement*)channelElement).children) {
        if (CXMLAttributeKind == childNode.kind) {
            if (NSOrderedSame == [childNode.name compare:kRRFRSSTitle]) {
                channel.title = childNode.stringValue;
            } else if (NSOrderedSame == [childNode.name compare:kRRFRSSLink]) {
                channel.link = childNode.stringValue;
            } else if (NSOrderedSame == [childNode.name compare:kRRFRSSDescription]) {
                channel.description = childNode.stringValue;
            } else if (NSOrderedSame == [childNode.name compare:kRRFRSSLanguage]) {
                channel.language = childNode.stringValue;
            } else if (NSOrderedSame == [childNode.name compare:kRRFRSSCopyright]) {
                channel.copyright = childNode.stringValue;
            } else if (NSOrderedSame == [childNode.name compare:kRRFRSSManagingEditor]) {
                channel.managingEditor = childNode.stringValue;
            } else if (NSOrderedSame == [childNode.name compare:kRRFRSSWebMaster]) {
                channel.webMaster = childNode.stringValue;
            } else if (NSOrderedSame == [childNode.name compare:kRRFRSSPubDate]) {
                channel.pubDate = childNode.stringValue;
            } else if (NSOrderedSame == [childNode.name compare:kRRFRSSLastBuildDate]) {
                channel.lastBuildDate = childNode.stringValue;
            } else if (NSOrderedSame == [childNode.name compare:kRRFRSSCategory]) {
                channel.category = childNode.stringValue;
            } else if (NSOrderedSame == [childNode.name compare:kRRFRSSGenerator]) {
                channel.generator = childNode.stringValue;
            } else if (NSOrderedSame == [childNode.name compare:kRRFRSSDocs]) {
                channel.docs = childNode.stringValue;
            } else if (NSOrderedSame == [childNode.name compare:kRRFRSSCloud]) {
                channel.cloud = childNode.stringValue;
            } else if (NSOrderedSame == [childNode.name compare:kRRFRSSTtl]) {
                channel.ttl = childNode.stringValue;
            } else if (NSOrderedSame == [childNode.name compare:kRRFRSSImage]) {
                channel.image = childNode.stringValue;
            } else if (NSOrderedSame == [childNode.name compare:kRRFRSSRating]) {
                channel.rating = childNode.stringValue;
            } else if (NSOrderedSame == [childNode.name compare:kRRFRSSTextInput]) {
                channel.textInput = childNode.stringValue;
            } else if (NSOrderedSame == [childNode.name compare:kRRFRSSSkipHours]) {
                channel.skipHours = childNode.stringValue;
            } else if (NSOrderedSame == [childNode.name compare:kRRFRSSSkipDays]) {
                channel.skipDays = childNode.stringValue;
            }
        }
    }
    return channel;
}

@end
