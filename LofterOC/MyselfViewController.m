//
//  MyselfViewController.m
//  LofterOC
//
//  Created by Elise on 16/8/25.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "MyselfViewController.h"

@interface MyselfViewController ()

@end

@implementation MyselfViewController

#pragma mark - lifeCycle

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setTabBarWithTitle:@"我的" withTag:4 withImageStr:@"个人主页icon_非当前帧" withSelectedImageStr:@"个人主页icon_当前帧"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
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
