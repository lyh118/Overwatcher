//
//  ItemStore.m
//  Overwatcher
//
//  Created by N3962 on 2016. 12. 22..
//  Copyright © 2016년 infradev. All rights reserved.
//

#import "ItemStore.h"
#import "AssemblyInfoService.h"

@interface ItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

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
    if(self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSArray *) allItems {
    return self.privateItems;
}

- (NSString *) createItem {
    NSString *item = @"test";
    
    NSLog(@"Created Item");
    
    //[AssemblyInfoService getAssemblyList:0];
    //[AssemblyInfoService getAssemblyListForXml:0];
    [[[AssemblyInfoService alloc] init] getAssemblyList:0];
    
    
    
    [self.privateItems addObject:item];
    
    return item;
        
}

@end
