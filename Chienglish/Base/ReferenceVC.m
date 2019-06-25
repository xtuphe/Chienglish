//
//  ReferenceVC.m
//  Chienglish
//
//  Created by 谢嘉康 on 2019/6/24.
//  Copyright © 2019 谢嘉康. All rights reserved.
//

#import "ReferenceVC.h"

@interface ReferenceVC ()

@property UIButton *button;

@end

@implementation ReferenceVC

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
    
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.size.width, self.size.height)];
    [self.button setTitle:@"aaaaaaaaaaa" forState:UIControlStateNormal];
    [self.button setBackgroundColor:[UIColor blueColor]];
    [self.button addTarget:self action:@selector(fuckIfItDontWork) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
}

- (void)fuckIfItDontWork{
    NSLog(@"???????????????????");
    NSLog(@"1111111111");

}
    
- (void)longerNameThatShallNoRepeatLeft:(UIBarButtonItem *)button {
    NSLog(@"???????????????????");
    NSLog(@"1111111111");
}


- (void)longerNameThatShallNoRepeatLeftRight:(UIBarButtonItem *)button {
    NSLog(@"2222222222");
    NSLog(@"???????????????????");
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
