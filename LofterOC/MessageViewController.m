//
//  MessageViewController.m
//  LofterOC
//
//  Created by Elise on 16/8/25.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "MessageViewController.h"
#import "TableThreeSwitchView.h"

@interface MessageViewController () <TableThreeSwitchViewDelegate>

@property (nonatomic,strong)TableThreeSwitchView *tableThreeSwitchView;

@end

@implementation MessageViewController

#pragma mark - lifeCycle

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setTabBarWithTitle:@"消息" withTag:3 withImageStr:@"消息页icon_非当前帧" withSelectedImageStr:@"消息页icon_当前帧"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - private

- (void)setNavigation {
    self.tableThreeSwitchView = [[TableThreeSwitchView alloc] initWithLeftText:@"动态" withMidText:@"消息" withRightText:@"聊天"];
    self.tableThreeSwitchView.frame = CGRectMake(0, 0, AppWidth, 44);
    __weak typeof(self) weakSelf = self;
    self.tableThreeSwitchView.delegate = weakSelf;
    self.navigationItem.titleView = self.tableThreeSwitchView;
    
}

#pragma mark - TableThreeSwitchViewDelegate

- (void)tableThreeSwitchViewDelegate:(TableThreeSwitchView *)tableThreeSwitchView didSelectedButton:(UIButton *)button forIndex:(NSInteger)index {
    
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
