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

+ (void)getAssemblyInfoService:(NSString*)uri withParam:(NSDictionary*)params withHandler:(ServiceHandler)handler {
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultConfigObject delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSString *serviceKey = @"eYeTEIVhPjmDBIGUJmwFyafEeGcdj%2FXCwIXAL5TAlxBoksAcc4tTrkD0HZqhfRdhTZ85udwVHpp9835HCiyguA%3D%3D";
    NSString *reqUrl = [NSString stringWithFormat:@"http://apis.data.go.kr/9710000/NationalAssemblyInfoService/%@?ServiceKey=%@", uri, serviceKey];;
    
    
    // http://apis.data.go.kr/9710000/NationalAssemblyInfoService/getMemberDetailInfoList?dept_cd=9770275&num=76&ServiceKey=[서비스키]
    
    // 파라미터가 있는 경우 Request URL에 파라미터 추가
    if (params) {
        for (id key in params) {
            reqUrl = [reqUrl stringByAppendingString:@"&"];
            reqUrl = [reqUrl stringByAppendingString:key];
            reqUrl = [reqUrl stringByAppendingString:@"="];
            reqUrl = [reqUrl stringByAppendingString:[params objectForKey:key]];
        }
    }
    
    NSLog(@"withParam = %@", reqUrl);
    
    NSURL *url = [NSURL URLWithString:reqUrl];
    
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithURL:url
                                                   completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
                                                       
                                                       if(error == nil) {
                                                           if(handler){
                                                               handler(data, error);
                                                           }
                                                       }
                                                   }];
    [dataTask resume];
}


- (void)getAssemblyList:(NSInteger)page withHandler:(ServiceHandler)handler {
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultConfigObject delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    
    NSString *getMemberCurrStateList = @"getMemberCurrStateList";
    NSString *key = @"eYeTEIVhPjmDBIGUJmwFyafEeGcdj%2FXCwIXAL5TAlxBoksAcc4tTrkD0HZqhfRdhTZ85udwVHpp9835HCiyguA%3D%3D";
    NSString *reqUrl = [NSString stringWithFormat:@"http://apis.data.go.kr/9710000/NationalAssemblyInfoService/%@?ServiceKey=%@", getMemberCurrStateList, key];;
    
    NSURL *url = [NSURL URLWithString:reqUrl];
    
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithURL:url
                                                   completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
                                                       
                                                       if(error == nil) {
                                                           
                                                           if(handler){
                                                               handler(data, error);
                                                           }
                                                           
                                                           
                                                           
                                                       }
                                                   }];
    [dataTask resume];

}

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


@end
