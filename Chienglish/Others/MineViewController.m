//
//  MineViewController.m
//  TabBarControllerCustomDemo
//
//  Created by sjimac01 on 2018/1/24.
//  Copyright © 2018年 sjimac01. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat height = 44;
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.size.width, height)];
    headerLabel.text = self.term;
    headerLabel.textColor = UIColor.whiteColor;
    headerLabel.backgroundColor = UIColor.blackColor;
    headerLabel.font = [UIFont boldSystemFontOfSize:20];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:headerLabel];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.size.height - height, self.size.width, height)];
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
