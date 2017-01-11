//
//  AssemblyInfoService.h
//  Overwatcher
//
//  Created by N3962 on 2017. 1. 4..
//  Copyright © 2017년 infradev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ServiceHandler)(NSData *data, NSError *error);

@interface AssemblyInfoService : NSObject <NSURLSessionDelegate, NSXMLParserDelegate>

//+ (id)sharedService;
- (void)getAssemblyList:(NSInteger)page;

- (void)getAssemblyList:(NSInteger)page withHandler:(ServiceHandler)handler;

+ (void)getAssemblyInfoService:(NSString*)uri withParam:(NSDictionary*)params withHandler:(ServiceHandler)handler;

@end
