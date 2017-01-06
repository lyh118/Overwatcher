//
//  AssemblyInfoService.m
//  Overwatcher
//
//  Created by N3962 on 2017. 1. 4..
//  Copyright © 2017년 infradev. All rights reserved.
//

#import "AssemblyInfoService.h"
#import "XMLParseUtil.h"

@implementation AssemblyInfoService

/*
+(id)sharedService
{
    static AssemblyInfoService* assembl;
}
 */

- (void)getAssemblyList:(NSInteger)page {
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultConfigObject delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    
    NSString *getMemberCurrStateList = @"getMemberCurrStateList";
    NSString *key = @"eYeTEIVhPjmDBIGUJmwFyafEeGcdj%2FXCwIXAL5TAlxBoksAcc4tTrkD0HZqhfRdhTZ85udwVHpp9835HCiyguA%3D%3D";
    NSString *reqUrl = [NSString stringWithFormat:@"http://apis.data.go.kr/9710000/NationalAssemblyInfoService/%@?ServiceKey=%@", getMemberCurrStateList, key];;
    
    NSURL *url = [NSURL URLWithString:reqUrl];
    
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithURL:url
                                                   completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
                                                       
                                                       if(error == nil) {
                                                           
                                                           [[[XMLParseUtil alloc] init] parseData:data];
                                                           
                                                           
                                                       }
                                                   }];
    [dataTask resume];
    
}

- (void)getAssemblyListForXml:(NSInteger)page {
    
    NSString *getMemberCurrStateList = @"getMemberCurrStateList";
    NSString *key = @"eYeTEIVhPjmDBIGUJmwFyafEeGcdj%2FXCwIXAL5TAlxBoksAcc4tTrkD0HZqhfRdhTZ85udwVHpp9835HCiyguA%3D%3D";
    NSString *reqUrl = [NSString stringWithFormat:@"http://apis.data.go.kr/9710000/NationalAssemblyInfoService/%@?ServiceKey=%@", getMemberCurrStateList, key];;
    
    NSURL *url = [NSURL URLWithString:reqUrl];
    
    NSXMLParser *myParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [myParser setDelegate:self];
    
    //myParser.delegate = self;
    if([myParser parse]) {
        NSLog(@"============================SUCC=============================");
    }
    else {
        NSLog(@"============================FAIL=============================");
    };
}


/*
- (void)parser:(NSXMLParser *)parserdidStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    
    if ([elementName isEqualToString:@"item"]) {
        NSLog(@"============================item=============================");
    }
    
}
*/



@end
