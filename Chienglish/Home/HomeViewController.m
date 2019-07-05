//
//  HomeViewController.m
//  TabBarControllerCustomDemo
//
//  Created by sjimac01 on 2018/1/24.
//  Copyright © 2018年 sjimac01. All rights reserved.
//  轻格丽诗

#import "HomeViewController.h"
#import "Define.h"
#import "HomeDetailViewController.h"
#import "TabBarController.h"
#import "Tabbar.h"
#import "Chienglish-Swift.h"
#import <Alamofire/Alamofire-Swift.h>
#import <AlamofireImage-Swift.h>

@interface HomeViewController ()<UINavigationControllerDelegate,UIViewControllerAnimatedTransitioning,UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *data;         // 内容数组

@property (strong, nonatomic) UIView *headerView;               // 头部
@property (strong, nonatomic) UILabel *timeLabel;               // 时间
@property (strong, nonatomic) UILabel *titleLabel;              // Today
@property (strong, nonatomic) UIButton *userButton;             //

@end

@implementation HomeViewController
{
    NSIndexPath *selectIndexPath;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 隐藏导航条
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    // 设置navigaitonControllerDelegate
    self.navigationController.delegate = self;
    // 隐藏状态栏
    [UIView animateWithDuration:0.2 animations:^{
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = [self buildHeaderView];
    self.data = [NSMutableArray new];
    [self requestData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notiReceived:) name:@"homePageListData" object:nil];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)notiReceived:(NSNotification *)noti{
    HomeDataModel * model = noti.object;
    [self.data addObjectsFromArray:model.data];
    [self.tableView reloadData];
}

#pragma mark - Today 头像 UI

- (UIView *)buildHeaderView {
    
    // header
    self.headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 115);
    // 日期
    self.timeLabel.frame  = CGRectMake(SCREEN_RATIO(22), 30, SCREEN_WIDTH/2, 14);
    self.timeLabel.text = [self getWeekDay];
    // 标题
    self.titleLabel.frame = CGRectMake(SCREEN_RATIO(22),55 , (SCREEN_WIDTH/3)*2, 30);
    
    // 登录按钮
    self.userButton.frame = CGRectMake(SCREEN_WIDTH-44-SCREEN_RATIO(22), 38, 44, 44);
    self.userButton.layer.masksToBounds = YES;
    self.userButton.layer.cornerRadius = 22;
    [self.userButton addTarget:self action:@selector(userButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.userButton setImage:[UIImage imageNamed:@"Mine_photo_define"] forState:UIControlStateNormal];
    [self.headerView addSubview:self.timeLabel];
    [self.headerView addSubview:self.titleLabel];
    [self.headerView addSubview:self.userButton];
    
    return self.headerView;
}


#pragma mark - ==============================Click============================


- (void)userButtonClick {
    
}

#pragma mark - 获取当前时间，日期

- (NSString*)getWeekDay {
    
    NSDate*date =[NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"MM月dd日"];
    NSString *dateTime = [formatter stringFromDate:date];
    NSArray*weekdays = [NSArray arrayWithObjects: [NSNull null],@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",nil];
    NSCalendar*calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone*timeZone = [[NSTimeZone alloc]initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit =NSCalendarUnitWeekday;
    NSDateComponents*theComponents = [calendar components:calendarUnit fromDate:date];
    NSString *weekTime = [weekdays objectAtIndex:theComponents.weekday];
    return [NSString stringWithFormat:@"%@  %@",dateTime,weekTime];
}
#pragma mark - 截屏

- (UIImage *)imageFromView {
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}


#pragma mark - ==============================Data============================




#pragma mark - ==============================Delegate============================




#pragma mark - UITableViewDelegate,UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (SCREEN_WIDTH-40)*1.3+25;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HOMECELLID"];
    if (cell == nil) {
        cell = [[HomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HOMECELLID"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.shouldGroupAccessibilityChildren = YES;
    }
    HomeArticleModel *model = self.data[indexPath.row];
    [cell reloadWithModel:model];
    cell.transform = CGAffineTransformMakeScale(1, 1);
    return cell;
    
}
// TODO: 即将进入高亮状态
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath  {
    selectIndexPath = indexPath;
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [UIView animateWithDuration:0.2 animations:^{
        cell.transform = CGAffineTransformMakeScale(0.9, 0.9);
    }];
    
    return YES;
}
// TODO: 结束高亮状态
- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%u",cell.selected);
    
    if ([selectIndexPath isEqual:indexPath]) {
        [UIView animateWithDuration:0.2 animations:^{
            cell.transform = CGAffineTransformMakeScale(1, 1);
            return;
        }];
    }
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.transform = CGAffineTransformMakeScale(0.9, 0.9);
    HomeDetailViewController *detail = [[HomeDetailViewController alloc]init];
    HomeArticleModel *model = self.data[indexPath.row];
    detail.selectIndexPath = indexPath;
    detail.bgImage = [self imageFromView];
    detail.titles = model.title;
    detail.titleTwo = model.subtitle;
    detail.content = model.content;
    detail.image = cell.bgImageView.image;
    [self.navigationController pushViewController:detail animated:YES];
}

- (void)requestData {
    [XNetwork homePageListWithParam:@"page=1"];
}

#pragma mark - UIViewControllerAnimatedTransitioning
// MARK: 设置代理
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    return self;
}

// MARK: 设置动画时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    HomeCell *cell = (HomeCell *)[self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = [toVC valueForKeyPath:@"headerImageView"];
    UIView *fromView = cell.bgView;
    UIView *containerView = [transitionContext containerView];
    UIImageView *snapShotView = [[UIImageView alloc]initWithImage:cell.bgImageView.image];
    snapShotView.frame = [containerView convertRect:fromView.frame fromView:fromView.superview];
    snapShotView.contentMode = UIViewContentModeScaleAspectFill;
    snapShotView.clipsToBounds = YES;
    fromView.hidden = YES;
    
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.alpha = 0;
    toView.hidden = YES;
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, SCREEN_WIDTH-30, 30)];
    titleLabel.textColor = COLOR_WHITE;
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.font = FONT_B(25);
    titleLabel.text = cell.titleLabel.text;
    
    UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, (SCREEN_WIDTH-40)*1.3-30, SCREEN_WIDTH-44, 15)];
    contentLabel.font = FONT_PF(15);
    contentLabel.textColor = COLOR_WHITE;
    contentLabel.textAlignment = NSTextAlignmentLeft;
    contentLabel.alpha = 0.5;
    contentLabel.text =cell.contentLabel.text;
    contentLabel.numberOfLines = 0;
    [snapShotView addSubview:titleLabel];
    [snapShotView addSubview:contentLabel];
    [containerView addSubview:toVC.view];
    [containerView addSubview:snapShotView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0f usingSpringWithDamping:0.6f initialSpringVelocity:1.0f options:UIViewAnimationOptionCurveLinear animations:^{
        [containerView layoutIfNeeded];
        toVC.view.alpha = 1.0f;
         Tabbar*tabBar = (Tabbar *)self.tabBarController.tabBar;
        if (IPHONE_X) {
            tabBar.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 83);
        } else {
            tabBar.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 49);
        }
        snapShotView.frame = [containerView convertRect:toView.frame fromView:toView.superview];
        titleLabel.frame = CGRectMake(22, 30, SCREEN_WIDTH-30, 30);
        contentLabel.frame = CGRectMake(22, SCREEN_WIDTH*1.3-30, SCREEN_WIDTH*1.3-44, 15);
        
    } completion:^(BOOL finished) {
        
        toView.hidden = NO;
        fromView.hidden = NO;
        [snapShotView removeFromSuperview];
        [self.tableView reloadData];
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
 
}


#pragma mark - ==============================实例化============================



- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = COLOR_CLEAR;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (UIView *)headerView {
    if (_headerView == nil) {
        _headerView = [[UIView alloc]init];
        _headerView.backgroundColor = COLOR_CLEAR;
        
    }
    return _headerView;
}

- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = FONT_14;
        _timeLabel.textColor = COLOR_6;
        _timeLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _timeLabel;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = FONT_B(30);
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = COLOR_3;
        _titleLabel.text = HOME_TITLE;
    }
    return _titleLabel;
}

- (UIButton *)userButton {
    if (_userButton == nil) {
        _userButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _userButton.backgroundColor = COLOR_CLEAR;
    }
    return _userButton;
}

@end
