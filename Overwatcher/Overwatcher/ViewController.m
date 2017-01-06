//
//  ViewController.m
//  Overwatcher
//
//  Created by N3962 on 2016. 12. 20..
//  Copyright © 2016년 infradev. All rights reserved.
//

#import "ViewController.h"
#import "MemberTableViewCell.h"
#import "ItemStore.h"

@interface ViewController ()

//@property (nonatomic,strong)NSMutableArray* array;

@end

@implementation ViewController

/*
- (NSMutableArray*)array {
    if (_array==nil) {
        _array=[[NSMutableArray alloc] init];
        for (int i=0; i<5; i++) {
            [self.array addObject:[NSString stringWithFormat:@"ITEM%d",i]];
        }
    }
    
    return _array;
}
 */

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        for (int i=0; i<1; i++) {
            [[ItemStore sharedStore] createItem];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //return self.array.count;
    return [[[ItemStore sharedStore] allItems] count];
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MemberTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"member"];
    
    NSArray *items = [[ItemStore sharedStore] allItems];
    NSString *item = items[indexPath.row];
    
    NSURL *imageURL = [NSURL URLWithString:@"http://www.assembly.go.kr/photo/9770703.jpg"];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    cell.memberImageView.image=[UIImage imageWithData:imageData];
    
    //cell.nameLabel.text = [self.array objectAtIndex:indexPath.row];
    //cell.nameLabel.text = @"TEST";
    
    cell.nameLabel.text = item;
    
    return cell;
}


/*
 -(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
 return 1;
 }
 */

@end
