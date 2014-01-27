//
//  TSTweet.m
//  TwitterStreams
//
//  Created by Stuart Hall on 6/03/12.
//  Copyright (c) 2012 Stuart Hall. All rights reserved.
//

#import "TSTweet.h"
#import "NSArray+Enumerable.h"

@interface TSTweet()
@property (nonatomic, strong) TSUser* cachedUser;
@property (nonatomic, strong) NSArray* cachedUserMentions;
@property (nonatomic, strong) NSArray* cachedUrls;
@property (nonatomic, strong) NSArray* cachedHashtags;
@end

@implementation TSTweet

@synthesize cachedUser=_cachedUser;
@synthesize cachedUserMentions=_cachedUserMentions;
@synthesize cachedUrls=_cachedUrls;
@synthesize cachedHashtags=_cachedHashtags;


- (NSString*)text {
    return [self.dictionary objectForKey:@"text"];
}

- (TSUser*)user {
    if (!self.cachedUser)
        self.cachedUser = [[TSUser alloc] initWithDictionary:[self.dictionary objectForKey:@"user"]];
    
    return self.cachedUser;
}

- (NSArray*)userMentions {
    if (!self.cachedUserMentions) {
        self.cachedUserMentions = [[self.dictionary valueForKeyPath:@"entities.user_mentions"] map:^id(NSDictionary* d) {
            return [[TSUser alloc] initWithDictionary:d];
        }];
    }
    
    return self.cachedUserMentions;
}

- (NSArray*)urls {
    if (!self.cachedUrls) {
        self.cachedUrls = [[self.dictionary valueForKeyPath:@"entities.urls"] map:^id(NSDictionary* d) {
            return [[TSUrl alloc] initWithDictionary:d];
        }];
    }
    
    return self.cachedUrls;
}

- (NSArray*)hashtags {
    if (!self.cachedHashtags) {
        self.cachedHashtags = [[self.dictionary valueForKeyPath:@"entities.hashtags"] map:^id(NSDictionary* d) {
            return [[TSHashtag alloc] initWithDictionary:d];
        }];
    }
    
    return self.cachedHashtags;
}

@end
