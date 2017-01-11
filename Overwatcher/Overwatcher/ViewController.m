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
#import "AssemblyInfoService.h"
#import "XMLDictionary.h"

@interface ViewController ()

@property (nonatomic,strong)NSMutableArray* array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
    [dictionary setObject:@"getMemberCurrStateList" forKey:@"uri"];
    [dictionary setObject:@"test1" forKey:@"first"];
    [dictionary setObject:@"test2" forKey:@"second"];
    
    [AssemblyInfoService getAssemblyInfoService:@"getMemberCurrStateList" withParam:dictionary withHandler:^(NSData *data, NSError *error) {
        if(error) {
            
        }
    }];
    
    
    AssemblyInfoService *service = [[AssemblyInfoService alloc] init];
    [service getAssemblyList:0 withHandler:^(NSData *data, NSError *error) {
        if(error) {
            
        }
        else {            
            //NSString *text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            //NSLog(@"Data = %@", text);
            
            NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLData:data];
            //NSString *foo = [xmlDoc valueForKeyPath:@"header.resultCode"];
            //NSLog(@"DataFoo = %@", xmlDoc);
            //NSLog(@"DataFoo = %@", foo);
            NSArray *arr = [xmlDoc arrayValueForKeyPath:@"body.items.item"];
            NSLog(@"DataArr = %@", arr);
            
            self.array = [NSMutableArray arrayWithArray:arr];
            
            [self.tableView reloadData];
            //NSIndexPath *indexPath = [NSIndexPath indexPathForRow:10 inSection:0];
            //[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
            
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 * TableView Item 개수를 지정한다
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"ArrCount = %lu", (unsigned long)self.array.count);
    return self.array.count;
}

/*
 * TableView에 보여지는 Item을 제어 한다
 */
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MemberTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"member"];
    
    // 전체 Item Array
    NSArray *items = self.array;
    NSDictionary *item = items[indexPath.row];
    
    NSLog(@"tableView item = %@", item);
    
    // Image
    //NSURL *imageURL = [NSURL URLWithString:@"http://www.assembly.go.kr/photo/9770703.jpg"];
    NSURL *imageURL     = [NSURL URLWithString:[item objectForKey:@"jpgLink"]];
    NSData *imageData   = [NSData dataWithContentsOfURL:imageURL];
    cell.memberImageView.image = [UIImage imageWithData:imageData];
    
    //cell.label1.text = [self.array objectAtIndex:indexPath.row];  // Array의 경우 objectAtIndx:(NSInteger) 로 값을 가지고 온다
    cell.nameLabel.text = [item objectForKey:@"empNm"]; // Dictionay의 경우 objectForKey:(NSObject) 로 값을 가지고 온다.
    cell.label1.text    = [item objectForKey:@"origNm"];
    cell.label2.text    = [item objectForKey:@"reeleGbnNm"];
    
    return cell;
}

@end
