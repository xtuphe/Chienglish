//
//  CenterViewController.m
//  TabBarControllerCustomDemo
//
//  Created by sjimac01 on 2018/1/24.
//  Copyright © 2018年 sjimac01. All rights reserved.
//

#import "CenterViewController.h"

@interface CenterViewController ()

@end

@implementation CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self  action:@selector(Tap:)];
    [self.view addGestureRecognizer:tap];
    
    CGFloat height = 44;
    
    CGSize size = CGSizeMake(200, 200);
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, height)];
    headerLabel.text = @"9999999999999999999";
    headerLabel.textColor = UIColor.whiteColor;
    headerLabel.backgroundColor = UIColor.blackColor;
    headerLabel.font = [UIFont boldSystemFontOfSize:20];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:headerLabel];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, size.height - height, size.width, height)];
    [self.view addSubview:toolBar];
    toolBar.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(longerNameThatShallNoRepeatLeft:)];
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(longerNameThatShallNoRepeatLeftRight:)];
    [toolBar setItems:@[left, right]];
    toolBar.userInteractionEnabled = YES;
    left.enabled = YES;
    right.enabled = YES;
}

- (void)longerNameThatShallNoRepeatLeft:(UIBarButtonItem *)button {
    NSLog(@"???????????????????");
    NSLog(@"1111111111");
}


- (void)longerNameThatShallNoRepeatLeftRight:(UIBarButtonItem *)button {
    NSLog(@"2222222222");
    NSLog(@"???????????????????");
}



- (void)Tap:(UITapGestureRecognizer *)tap {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
