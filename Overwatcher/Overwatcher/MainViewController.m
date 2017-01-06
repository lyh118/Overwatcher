//
//  MainViewController.m
//  Overwatcher
//
//  Created by N3962 on 2016. 12. 20..
//  Copyright © 2016년 infradev. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (nonatomic, weak) IBOutlet UINavigationBar *navigationBar;
@property (nonatomic, weak) IBOutlet UITextField *textFile;
@property (nonatomic, weak) IBOutlet UIButton *searchButton;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, copy) NSArray *content;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype) initWithNibName:(NSString *)nibNameOrNil
                          bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self) {
        self.content = @[@"Comtets1",
                         @"Comtets2",
                         @"Comtets3"];
    }
    
    return self;
}


- (IBAction)searchAssembly:(id)sender {
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultConfigObject delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    
    NSString *getMemberCurrStateList = @"getMemberCurrStateList";
    NSString *key = @"eYeTEIVhPjmDBIGUJmwFyafEeGcdj%2FXCwIXAL5TAlxBoksAcc4tTrkD0HZqhfRdhTZ85udwVHpp9835HCiyguA%3D%3D";
    NSString *reqUrl = [NSString stringWithFormat:@"http://apis.data.go.kr/9710000/NationalAssemblyInfoService/%@?ServiceKey=%@", getMemberCurrStateList, key];;
    
    NSURL *url = [NSURL URLWithString:reqUrl];
    
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithURL:url
                                                   completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
                                                       
                                                       if(error == nil) {
                                                           NSString *text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                           NSLog(@"Data = %@", text);
                                                       }
                                                   }];
    [dataTask resume];
    
}


@end
