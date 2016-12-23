//
//  ItemStore.m
//  Overwatcher
//
//  Created by N3962 on 2016. 12. 22..
//  Copyright © 2016년 infradev. All rights reserved.
//

#import "ItemStore.h"

@implementation ItemStore

+ (instancetype) sharedStore {
    static ItemStore *sharedStore = nil;
    
    if(!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    
    
    return sharedStore;
}

- (instancetype) init {
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[ItemStore sharedStore]" userInfo:nil];
}

- (instancetype) initPrivate {
    self = [super init];
    
    return self;
}

@end
