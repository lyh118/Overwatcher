//
//  MemberDetailViewController.m
//  Overwatcher
//
//  Created by N3962 on 2017. 1. 23..
//  Copyright © 2017년 infradev. All rights reserved.
//

#import "MemberDetailViewController.h"
#import "AssemblyInfoService.h"
#import "XMLDictionary.h"

@interface MemberDetailViewController ()

@end

@implementation MemberDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

static int cnt=0;
- (void)loadData {
    
    NSLog(@"Dictionary Params = %@", _params);
    //http://apis.data.go.kr/9710000/NationalAssemblyInfoService/getMemberDetailInfoList?dept_cd=9770275&num=76&ServiceKey=[서비스키]
    
    // #1.Call API
    [AssemblyInfoService getAssemblyInfoService:@"getMemberDetailInfoList" withParam:_params withHandler:^(NSData *data, NSError *error) {
        if(error) {
            if (cnt<3) {
                cnt++;
                [self performSelector:@selector(loadData) withObject:nil afterDelay:1];
                
            }
        }
        else {
            NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLData:data];
            //NSString *foo = [xmlDoc valueForKeyPath:@"header.resultCode"];
            //NSLog(@"DataFoo = %@", xmlDoc);
            //NSLog(@"DataFoo = %@", foo);
            //NSArray *arr = [xmlDoc arrayValueForKeyPath:@"body.item"];
            NSDictionary *dic = [xmlDoc dictionaryValueForKeyPath:@"body.item"];
            NSLog(@"DataDic = %@", dic);
            
            // navigationBar Title 설정
            [self.navigationController.navigationBar.topItem setTitle:[dic objectForKey:@"empNm"]];
            //self.navigationItem.title = @"TEST";
            
            // Member 이미지 설정
            NSURL *imageURL     = [NSURL URLWithString:_memberImageUrl];
            NSData *imageData   = [NSData dataWithContentsOfURL:imageURL];
            _memberImageView.image = [UIImage imageWithData:imageData];
            
            _nameLabel.text         = [dic objectForKey:@"empNm"];      // 이름
            _reeleGbnNmLabel.text   = [dic objectForKey:@"reeleGbnNm"]; // 당선횟수
            _polyNameLabel.text     = [dic objectForKey:@"polyNm"];     // 소속정당
            _origNameLabel.text     = [dic objectForKey:@"origNm"];     // 선거구
            _sharNameLabel.text     = [dic objectForKey:@"shrtNm"];     // 소속위원회
            _assemTelLabel.text     = [dic objectForKey:@"assemTel"];   // 전화번호
            _assemEmailLabel.text   = [dic objectForKey:@"assemEmail"]; // 이메일
            _assemHomepageLabel.text= [dic objectForKey:@"assemHomep"]; // 홈페이지
            _memTitleTextView.text  = [dic objectForKey:@"memTitle"];   // 약력
            
            cnt = 0;
        }
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
