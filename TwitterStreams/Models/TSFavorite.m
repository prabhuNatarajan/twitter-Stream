//
//  TSFavorite.m
//  TwitterStreams
//
//  Created by Stuart Hall on 6/03/12.
//  Copyright (c) 2012 Stuart Hall. All rights reserved.
//

#import "TSFavorite.h"

@implementation TSFavorite

- (TSUser*)source {
    return [[TSUser alloc] initWithDictionary:[self.dictionary objectForKey:@"source"]];
}

- (TSUser*)target {
    return [[TSUser alloc] initWithDictionary:[self.dictionary objectForKey:@"target"]];
}

- (TSTweet*)tweet {
    return [[TSTweet alloc] initWithDictionary:[self.dictionary objectForKey:@"target_object"]];
}

@end
