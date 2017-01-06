//
//  AssemblyInfoService.h
//  Overwatcher
//
//  Created by N3962 on 2017. 1. 4..
//  Copyright © 2017년 infradev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AssemblyInfoService : NSObject <NSURLSessionDelegate, NSXMLParserDelegate>

//+ (id)sharedService;
- (void)getAssemblyList:(NSInteger)page;
- (void)getAssemblyListForXml:(NSInteger)page;

@end
