//
//  MemberDetailViewController.h
//  Overwatcher
//
//  Created by N3962 on 2017. 1. 23..
//  Copyright © 2017년 infradev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemberDetailViewController : UIViewController

@property (nonatomic,strong)NSMutableDictionary* params;
@property (nonatomic,strong)NSString* memberImageUrl;

@property (weak, nonatomic) IBOutlet UIImageView *memberImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *reeleGbnNmLabel;
@property (weak, nonatomic) IBOutlet UILabel *polyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *origNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sharNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *assemTelLabel;
@property (weak, nonatomic) IBOutlet UILabel *assemHomepageLabel;
@property (weak, nonatomic) IBOutlet UILabel *assemEmailLabel;

@property (weak, nonatomic) IBOutlet UITextView *memTitleTextView;

@end
