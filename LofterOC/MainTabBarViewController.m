//
//  MainTabBarViewController.m
//  LofterOC
//
//  Created by Elise on 16/8/25.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "HomeViewController.h"
#import "DescoverViewController.h"
#import "IssueViewController.h"
#import "MessageViewController.h"
#import "MyselfViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>


@interface MainTabBarViewController ()

@property (nonatomic,strong) UIImageView *logoView;

@end

@implementation MainTabBarViewController


#pragma mark - lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpViews];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.logoView = [[UIImageView alloc] initWithFrame:MainBounds];
    [self.logoView setImage:[UIImage imageNamed:@"preview1"]];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication].keyWindow addSubview:self.logoView];
    self.tabBarController.selectedIndex = 2;
    [UIView animateWithDuration:1.5 delay:0.8 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.logoView.center = CGPointMake(AppWidth * -0.5, AppHeight * 0.5);
    } completion:^(BOOL finished) {
        [self.logoView removeFromSuperview];
    }];
    
}
#pragma mark - private

- (void)setUpViews {
    HomeViewController *homeView = [[HomeViewController alloc] init];
    UINavigationController *homeViewNC = [[UINavigationController alloc] init];
    [homeViewNC setViewControllers:@[homeView]];
    
    DescoverViewController *descoverView = [[DescoverViewController alloc] init];
    UINavigationController *descoverViewNC = [[UINavigationController alloc] init];
    [descoverViewNC setViewControllers:@[descoverView]];
    
    IssueViewController *issueView = [[IssueViewController alloc] init];
    UINavigationController *issueViewNC = [[UINavigationController alloc] init];
    [issueViewNC setViewControllers:@[issueView]];
    
    MessageViewController *messageView = [[MessageViewController alloc] init];
    UINavigationController *messageViewNC = [[UINavigationController alloc] init];
    [messageViewNC setViewControllers:@[messageView]];
    
    MyselfViewController *myselfView = [[MyselfViewController alloc] init];
    UINavigationController *myselfViewNC = [[UINavigationController alloc] init];
    [myselfViewNC setViewControllers:@[myselfView]];
    
    self.viewControllers = @[homeViewNC,descoverViewNC,issueViewNC,messageViewNC,myselfViewNC];

    self.tabBar.backgroundColor = [UIColor clearColor];
    self.tabBar.translucent = true;
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
