//
//  RRFRSSItem.m
//  RRFRSSFeed
//
//  Created by Rob Fahrni on 8/2/14.
//  Copyright (c) 2014 Hayseed. All rights reserved.
//
#import "RRFRSSItem.h"
#import "RRFRSSConst.h"
#import "CXMLElement.h"

@interface RRFRSSItem ()
@property (nonatomic, readwrite, copy) NSString* title;
@property (nonatomic, readwrite, copy) NSString* link;
@property (nonatomic, readwrite, copy) NSString* itemDescription;
@property (nonatomic, readwrite, copy) NSString* author;
@property (nonatomic, readwrite, copy) NSString* category;
@property (nonatomic, readwrite, copy) NSString* comments;
@property (nonatomic, readwrite, copy) NSString* enclosure;
@property (nonatomic, readwrite, copy) NSString* guid;
@property (nonatomic, readwrite, copy) NSString* pubDate;
@property (nonatomic, readwrite, copy) NSString* source;
@end

@implementation RRFRSSItem

+ (instancetype)itemFrom:(id)itemElement
{
    RRFRSSItem* item = [RRFRSSItem new];
    for (CXMLNode* childNode in ((CXMLElement*)itemElement).children) {
        if (NSOrderedSame == [childNode.name compare:kRRFRSSTitle]) {
            item.title = childNode.stringValue;
        } else if (NSOrderedSame == [childNode.name compare:kRRFRSSLink]) {
            item.link = childNode.stringValue;
        } else if (NSOrderedSame == [childNode.name compare:kRRFRSSDescription]) {
            item.itemDescription = childNode.stringValue;
        } else if (NSOrderedSame == [childNode.name compare:kRRFRSSAuthor]) {
            item.author = childNode.stringValue;
        } else if (NSOrderedSame == [childNode.name compare:kRRFRSSCategory]) {
            item.category = childNode.stringValue;
        } else if (NSOrderedSame == [childNode.name compare:kRRFRSSComments]) {
            item.comments = childNode.stringValue;
        } else if (NSOrderedSame == [childNode.name compare:kRRFRSSEnclosure]) {
            item.enclosure = childNode.stringValue;
        } else if (NSOrderedSame == [childNode.name compare:kRRFRSSGuid]) {
            item.guid = childNode.stringValue;
        } else if (NSOrderedSame == [childNode.name compare:kRRFRSSPubDate]) {
            item.pubDate = childNode.stringValue;
        } else if (NSOrderedSame == [childNode.name compare:kRRFRSSSource]) {
            item.source = childNode.stringValue;
        }
    }
    return item;
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"<RRFRSSItem title: %@, itemDescription: %@, link: %@", self.title, self.itemDescription, self.link];
}

@end
