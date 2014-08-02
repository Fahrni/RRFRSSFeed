//
//  RRFRSSFeedTypes.h
//  RRFRSSFeed
//
//  Created by Rob Fahrni on 8/2/14.
//  Copyright (c) 2014 Hayseed. All rights reserved.
//

// Forward delcaration for RRFRSSFeed
@class RRFRSSFeed;

// Simple typedef's for expected blocks
typedef void (^RRFRSSFailureBlock)(NSError* error);
typedef void (^RRFRSSEmptySuccessBlock)();
typedef void (^RRFRSSFeedSuccessBlock)(RRFRSSFeed* feed);

