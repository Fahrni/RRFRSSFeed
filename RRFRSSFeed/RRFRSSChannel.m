//
//  RRFRSSChannel.m
//  RRFRSSFeed
//
//  Created by Rob Fahrni on 8/2/14.
//  Copyright (c) 2014 Hayseed. All rights reserved.
//
#import "RRFRSSChannel.h"

@implementation RRFRSSChannel
// Required RSS 2.0 Channel Elements
@synthesize title;
@synthesize link;
@synthesize description;
// Optional RRS 2.0 Channel Elements
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
@end
