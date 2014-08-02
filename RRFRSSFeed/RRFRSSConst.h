//
//  RRFRSSConst.h
//  RRFRSSFeed
//
//  Created by Rob Fahrni on 8/2/14.
//  Copyright (c) 2014 Hayseed. All rights reserved.
//

static NSString* const kRRFRSSErrorDomain = @"RRFRSSErrorDomain";

// GCD queue name
static char* const kRRFRSSUpdateQueue = "RRFRSSUpdateQueue";

// RSS element names
static NSString* const kRRFRSSRoot              = @"//rss";
static NSString* const kRRFRSSChannelElement    = @"//channel";
static NSString* const kRRFRSSElementElement    = @"//element";

// RSS element element names
static NSString* const kRRFRSSRootElement       = @"rss";
static NSString* const kRRFRSSVersion           = @"version";

// Shared element names (Channel and Element)
static NSString* const kRRFRSSTitle             = @"title";
static NSString* const kRRFRSSLink              = @"link";
static NSString* const kRRFRSSDescription       = @"description";
static NSString* const kRRFRSSCategory          = @"category";
static NSString* const kRRFRSSPubDate           = @"pubDate";

// Channel element names
static NSString* const kRRFRSSChannel           = @"channel";
static NSString* const kRRFRSSLanguage          = @"language";
static NSString* const kRRFRSSCopyright         = @"copyright";
static NSString* const kRRFRSSManagingEditor    = @"managingEditor";
static NSString* const kRRFRSSWebMaster         = @"webMaster";
static NSString* const kRRFRSSLastBuildDate     = @"lastBuildDate";
static NSString* const kRRFRSSGenerator         = @"generator";
static NSString* const kRRFRSSDocs              = @"docs";
static NSString* const kRRFRSSCloud             = @"cloud";
static NSString* const kRRFRSSTtl               = @"ttl";
static NSString* const kRRFRSSImage             = @"image";
static NSString* const kRRFRSSRating            = @"rating";
static NSString* const kRRFRSSTextInput         = @"textInput";
static NSString* const kRRFRSSSkipHours         = @"skipHours";
static NSString* const kRRFRSSSkipDays          = @"skipDays";

// Element element (yes, element element) names
static NSString* const kRRFRSSItem              = @"item";
static NSString* const kRRFRSSAuthor            = @"author";
static NSString* const kRRFRSSComments          = @"comments";
static NSString* const kRRFRSSEnclosure         = @"enclosure";
static NSString* const kRRFRSSGuid              = @"guid";
static NSString* const kRRFRSSSource            = @"source";

// Error Codes for NSError
static NSInteger const kRRFRSSInitFailed = -1;