//
//  XMLParseUtil.m
//  Overwatcher
//
//  Created by N3962 on 2017. 1. 6..
//  Copyright © 2017년 infradev. All rights reserved.
//

#import "XMLParseUtil.h"

@implementation XMLParseUtil

- (void)parseData:(NSData*)data {
    
    NSString *text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"Data = %@", text);
    
    
    NSXMLParser *myParser = [[NSXMLParser alloc] initWithData:data];
    myParser.delegate = self;
    
    if([myParser parse]) {
        NSLog(@"============================SUCC=============================");
    }
    else {
        NSLog(@"============================FAIL=============================");
    };
    
}



- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    NSLog(@"============================didStartElement=============================");
    if ([elementName isEqualToString:@"item"]) {
        NSLog(@"============================item=============================");
        return;
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    NSLog(@"============================didEndElement=============================");
    if ([elementName isEqualToString:@"item"]) {
        NSLog(@"============================item=============================");
    }
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    NSString *tagName = @"column";
    
    if([tagName isEqualToString:@"column"])
    {
        NSLog(@"Value %@",string);
    }
}

@end
