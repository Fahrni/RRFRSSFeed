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

//#define DUMP_NODE_TYPE
#if defined(DUMP_NODE_TYPE)
#define NODE_TYPE_TO_STRING(instance, nodeType)   [instance rrfrss_nodeTypeToName:nodeType]
#else
#define NODE_TYPE_TO_STRING(instance, nodeType)   @""
#endif // DEBUG

@interface RRFRSSChannel ()
// Required RSS 2.0 Channel Elements (http://cyber.law.harvard.edu/rss/rss.html#requiredChannelElements)
@property (nonatomic, readwrite, copy) NSString* title;
@property (nonatomic, readwrite, copy) NSString* link;
@property (nonatomic, readwrite, copy) NSString* channelDescription;
// Optional RRS 2.0 Channel Elements (http://cyber.law.harvard.edu/rss/rss.html#optionalChannelElements)
@property (nonatomic, readwrite, copy) NSString* language;
@property (nonatomic, readwrite, copy) NSString* copyright;
@property (nonatomic, readwrite, copy) NSString* managingEditor;
@property (nonatomic, readwrite, copy) NSString* webMaster;
@property (nonatomic, readwrite, copy) NSString* pubDate;
@property (nonatomic, readwrite, copy) NSString* lastBuildDate;
@property (nonatomic, readwrite, copy) NSString* category;
@property (nonatomic, readwrite, copy) NSString* generator;
@property (nonatomic, readwrite, copy) NSString* docs;
@property (nonatomic, readwrite, copy) NSString* cloud;
@property (nonatomic, readwrite, copy) NSString* ttl;
@property (nonatomic, readwrite, copy) NSString* image;
@property (nonatomic, readwrite, copy) NSString* rating;
@property (nonatomic, readwrite, copy) NSString* textInput;
@property (nonatomic, readwrite, copy) NSString* skipHours;
@property (nonatomic, readwrite, copy) NSString* skipDays;
@end

@implementation RRFRSSChannel

+ (instancetype)channelFrom:(id)channelElement
{
    RRFRSSChannel* channel = [RRFRSSChannel new];
    for (CXMLNode* childNode in ((CXMLElement*)channelElement).children) {
        //NSLog(@"childNode name: %@, node type: %@", childNode.name, NODE_TYPE_TO_STRING(channel, childNode.kind));
        if (CXMLElementKind == childNode.kind) {
            if ([childNode.name isEqualToString:kRRFRSSTitle]) {
                channel.title = childNode.stringValue;
            } else if ([childNode.name isEqualToString:kRRFRSSLink]) {
                channel.link = childNode.stringValue;
            } else if ([childNode.name isEqualToString:kRRFRSSDescription]) {
                channel.channelDescription = childNode.stringValue;
            } else if ([childNode.name isEqualToString:kRRFRSSLanguage]) {
                channel.language = childNode.stringValue;
            } else if ([childNode.name isEqualToString:kRRFRSSCopyright]) {
                channel.copyright = childNode.stringValue;
            } else if ([childNode.name isEqualToString:kRRFRSSManagingEditor]) {
                channel.managingEditor = childNode.stringValue;
            } else if ([childNode.name isEqualToString:kRRFRSSWebMaster]) {
                channel.webMaster = childNode.stringValue;
            } else if ([childNode.name isEqualToString:kRRFRSSPubDate]) {
                channel.pubDate = childNode.stringValue;
            } else if ([childNode.name isEqualToString:kRRFRSSLastBuildDate]) {
                channel.lastBuildDate = childNode.stringValue;
            } else if ([childNode.name isEqualToString:kRRFRSSCategory]) {
                channel.category = childNode.stringValue;
            } else if ([childNode.name isEqualToString:kRRFRSSGenerator]) {
                channel.generator = childNode.stringValue;
            } else if ([childNode.name isEqualToString:kRRFRSSDocs]) {
                channel.docs = childNode.stringValue;
            } else if ([childNode.name isEqualToString:kRRFRSSCloud]) {
                channel.cloud = childNode.stringValue;
            } else if ([childNode.name isEqualToString:kRRFRSSTtl]) {
                channel.ttl = childNode.stringValue;
            } else if ([childNode.name isEqualToString:kRRFRSSImage]) {
                channel.image = childNode.stringValue;
            } else if ([childNode.name isEqualToString:kRRFRSSRating]) {
                channel.rating = childNode.stringValue;
            } else if ([childNode.name isEqualToString:kRRFRSSTextInput]) {
                channel.textInput = childNode.stringValue;
            } else if ([childNode.name isEqualToString:kRRFRSSSkipHours]) {
                channel.skipHours = childNode.stringValue;
            } else if ([childNode.name isEqualToString:kRRFRSSSkipDays]) {
                channel.skipDays = childNode.stringValue;
            }
        }
    }
    return channel;
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"<RRFRSSChannel title: %@, channelDescription: %@, link: %@", self.title, self.channelDescription, self.link];
}

#if defined(DEBUG)
- (NSString*)rrfrss_nodeTypeToName:(CXMLNodeKind)nodeKind
{
    NSString* nodeTypeName = [NSString stringWithFormat:@"[UNKNOWN: %@]", @(nodeKind)];
    switch (nodeKind) {
    case CXMLInvalidKind:
            nodeTypeName = [NSString stringWithFormat:@"[CXMLInvalidKind: %@]", @(nodeKind)];
            break;
    case CXMLElementKind:
            nodeTypeName = [NSString stringWithFormat:@"[CXMLElementKind: %@]", @(nodeKind)];
            break;
    case CXMLAttributeKind:
            nodeTypeName = [NSString stringWithFormat:@"[CXMLAttributeKind: %@]", @(nodeKind)];
            break;
    case CXMLTextKind:
            nodeTypeName = [NSString stringWithFormat:@"[CXMLTextKind: %@]", @(nodeKind)];
            break;
    case CXMLProcessingInstructionKind:
            nodeTypeName = [NSString stringWithFormat:@"[CXMLProcessingInstructionKind: %@]", @(nodeKind)];
            break;
    case CXMLCommentKind:
            nodeTypeName = [NSString stringWithFormat:@"[CXMLCommentKind: %@]", @(nodeKind)];
            break;
    case CXMLNotationDeclarationKind:
            nodeTypeName = [NSString stringWithFormat:@"[CXMLNotationDeclarationKind: %@]", @(nodeKind)];
            break;
    case CXMLDTDKind:
            nodeTypeName = [NSString stringWithFormat:@"[CXMLDTDKind: %@]", @(nodeKind)];
            break;
    case CXMLElementDeclarationKind:
            nodeTypeName = [NSString stringWithFormat:@"[CXMLElementDeclarationKind: %@]", @(nodeKind)];
            break;
    case CXMLAttributeDeclarationKind:
            nodeTypeName = [NSString stringWithFormat:@"[CXMLAttributeDeclarationKind: %@]", @(nodeKind)];
            break;
    case CXMLEntityDeclarationKind:
            nodeTypeName = [NSString stringWithFormat:@"[CXMLEntityDeclarationKind: %@]", @(nodeKind)];
            break;
    case CXMLNamespaceKind:
            nodeTypeName = [NSString stringWithFormat:@"[CXMLNamespaceKind: %@]", @(nodeKind)];
            break;
    }
    return nodeTypeName;
}
#endif
@end
