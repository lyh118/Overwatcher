//
//  XMLParseUtil.h
//  Overwatcher
//
//  Created by N3962 on 2017. 1. 6..
//  Copyright © 2017년 infradev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLParseUtil : NSObject <NSXMLParserDelegate>

- (void)parseData:(NSData*)data;

@end
