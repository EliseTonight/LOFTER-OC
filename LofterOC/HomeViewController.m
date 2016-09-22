//
//  HomeViewController.m
//  LofterOC
//
//  Created by Elise on 16/8/25.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "HomeViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "TableSwitchView.h"
#import "HomeFocusModel.h"
#import "HomeSubscribeModel.h"
#import <MJExtension/MJExtension.h>
#import "SubscribeCell.h"
#import "LofterRefreshHeader.h"

static NSString *FocusCellId = @"FocusCellId";
static NSString *SubscribeCellId = @"SubscribeCellId";

@interface HomeViewController () <TabelSwitchViewDelegate,UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSInteger currentIndex;
    HomeFocusModels *modelPart1;
    HomeSubscribeModels *modelPart2;
}

@property (nonatomic,strong) TableSwitchView *tableSwitchView;
@property (nonatomic,strong) UIScrollView *mainScrollView;
@property (nonatomic,strong) UITableView *subscribeTabelView;
@property (nonatomic,strong) UITableView *focusTabelView;

@end

@implementation HomeViewController

#pragma mark - lifeCycle

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setTabBarWithTitle:@"首页" withTag:0 withImageStr:@"主页icon_非当前帧" withSelectedImageStr:@"主页icon_当前帧"];
        currentIndex = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation];
    [self setMainViews];
    
    [self.focusTabelView.mj_header beginRefreshing];
    [self.subscribeTabelView.mj_header beginRefreshing];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * (NSEC_PER_SEC)));
    dispatch_after(time, dispatch_get_main_queue(), ^{
        [self.tableSwitchView clickButtonWithIndex:currentIndex];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - lazy property

- (UITableView *)subscribeTabelView {
    if (_subscribeTabelView == nil) {
        _subscribeTabelView = [[UITableView alloc] initWithFrame:CGRectMake(AppWidth, SelfNavigationHeight + 20, AppWidth, AppHeight - SelfNavigationHeight - SelfTabBarHeight) style:UITableViewStylePlain];
        _subscribeTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _subscribeTabelView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
        _subscribeTabelView.tag = 1002;
    }
    return _subscribeTabelView;
}

- (UITableView *)focusTabelView {
    if (_focusTabelView == nil) {
        _focusTabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, SelfNavigationHeight + 20, AppWidth, AppHeight - SelfNavigationHeight - SelfTabBarHeight) style:UITableViewStylePlain];
        _focusTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _focusTabelView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
        _focusTabelView.tag = 1001;
    }
    return _focusTabelView;
}

- (UIScrollView *)mainScrollView {
    if (_mainScrollView == nil) {
        _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, AppWidth, AppHeight - SelfNavigationHeight)];
        _mainScrollView.delegate = self;
        _mainScrollView.pagingEnabled = true;
        _mainScrollView.contentSize = CGSizeMake(AppWidth * 2, 0);
        _mainScrollView.showsVerticalScrollIndicator = false;
        _mainScrollView.showsHorizontalScrollIndicator = false;
        _mainScrollView.backgroundColor = [UIColor whiteColor];
        _mainScrollView.tag = 1000;
    }
    return _mainScrollView;
}

#pragma mark - private;

- (void)setNavigation {
    self.tableSwitchView = [[TableSwitchView alloc] initWithLeftText:@"关注" withRightText:@"订阅"];
    __weak typeof(self) weakSelf = self;
    self.tableSwitchView.delegate = weakSelf;
    self.tableSwitchView.frame = CGRectMake(0, 0, AppWidth, 44);
    self.navigationItem.titleView = self.tableSwitchView;
    
    UIButton *rightButton = [[UIButton alloc] init];
    [rightButton setImage:[UIImage imageNamed:@"主页添加好友"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"主页添加好友按住"] forState:UIControlStateHighlighted];
    rightButton.frame = CGRectMake(0, 0, 36, 36);
    [rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    UIView *empty = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 36, 36)];
    empty.backgroundColor = [UIColor clearColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:empty];
    
}

- (void)setTableRefreshAnimationWithTarget:(id)target refreshAction:(SEL)selector gifFrame:(CGRect)frame targetTabelView:(UITableView *)tableView {
    LofterRefreshHeader *refreshHead = [LofterRefreshHeader headerWithRefreshingTarget:target refreshingAction:selector];
    refreshHead.gifView.frame = frame;
    tableView.mj_header = refreshHead;
}

- (void)setMainViews {
    self.focusTabelView.delegate = self;
    self.focusTabelView.dataSource = self;
    self.subscribeTabelView.delegate = self;
    self.subscribeTabelView.dataSource = self;
    [self setTableRefreshAnimationWithTarget:self refreshAction:@selector(loadHomeSubModel) gifFrame:CGRectMake((AppWidth - RefreshImage_Width) * 0.5, 15, RefreshImage_Width, RefreshImage_Height) targetTabelView:self.subscribeTabelView];
    [self setTableRefreshAnimationWithTarget:self refreshAction:@selector(loadHomeFocusModel) gifFrame:CGRectMake((AppWidth - RefreshImage_Width) * 0.5, 10, RefreshImage_Width, RefreshImage_Height) targetTabelView:self.focusTabelView];
    
    self.subscribeTabelView.tableHeaderView = [self subscribeTableViewHeadView];
    self.subscribeTabelView.tableFooterView = [self subscribeTableViewFootView];
    
    [self.view addSubview:self.mainScrollView];
    [self.mainScrollView addSubview:self.subscribeTabelView];
    [self.mainScrollView addSubview:self.focusTabelView];
}

- (UIView *)subscribeTableViewHeadView {
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, AppWidth, 50)];
    headView.backgroundColor = [UIColor whiteColor];
    
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, AppWidth, 15)];
    colorView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    [headView addSubview:colorView];
    
    UILabel *headLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 23, AppWidth - 16, 19)];
    headLabel.font = [UIFont systemFontOfSize:14];
    headLabel.text = @"我的订阅";
    headLabel.textColor = [UIColor darkGrayColor];
    [headView addSubview:headLabel];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 49.5, AppWidth, 0.5)];
    line.backgroundColor = [UIColor lightGrayColor];
    [headView addSubview:line];
    
    return headView;
}

- (UIView *)subscribeTableViewFootView {
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, AppWidth, 80)];
    footView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    
    UIButton *footButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 15, AppWidth, 50)];
    [footButton setBackgroundColor:[UIColor whiteColor]];
    [footButton setTitle:@"分类查看所有标签" forState:UIControlStateNormal];
    [footButton setTitleColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1.0] forState:UIControlStateNormal];
    footButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    footButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [footButton addTarget:self action:@selector(footButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:footButton];
    
    return footView;
}

#pragma mark - action

- (void)rightButtonClick:(UIButton *)sender {
    
}

- (void)footButtonClick:(UIButton *)sender {
    
}

#pragma mark - HTTP

- (void)loadHomeSubModel {
    __weak typeof(self) weakSelf = self;
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
    dispatch_after(time, dispatch_get_main_queue(), ^{
        NSString *path = [[NSBundle mainBundle] pathForResource:@"首页－订阅" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        if (data != nil) {
            NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            HomeSubscribeModels *homes = [HomeSubscribeModels mj_objectWithKeyValues:dict[@"response"]];
            modelPart2 = homes;
        }
        [weakSelf.subscribeTabelView reloadData];
        [weakSelf.subscribeTabelView.mj_header endRefreshing];
    });
}

- (void)loadHomeFocusModel {
    __weak typeof(self) weakSelf = self;
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
    dispatch_after(time, dispatch_get_main_queue(), ^{
        NSString *path = [[NSBundle mainBundle] pathForResource:@"首页－关注" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        if (data != nil) {
            NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            HomeFocusModels *homes = [HomeFocusModels mj_objectWithKeyValues:dict[@"response"]];
            modelPart1 = homes;
        }
        [weakSelf.focusTabelView reloadData];
        [weakSelf.focusTabelView.mj_header endRefreshing];
    });
}

#pragma mark - TabelSwitchViewDelegate

- (void)tableSwitchView:(TableSwitchView *)tableSwitchView didSelectedButton:(UIButton *)button forIndex:(NSInteger)index {
    currentIndex = index;
    [self.mainScrollView setContentOffset:CGPointMake((CGFloat)index * AppWidth, 0) animated:true];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.tag == 1000) {
        NSInteger index = (int)(scrollView.contentOffset.x / AppWidth);
        currentIndex = index;
        [self.tableSwitchView clickButtonWithIndex:currentIndex];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offSetY = scrollView.contentOffset.y;
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger returnValue = 0;
    if (tableView.tag == 1002) {
        if (modelPart2 != nil) {
            returnValue = modelPart2.tags.count;
        }
    }
    else {

    }
    return returnValue;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (tableView.tag == 1002) {
        cell = [tableView dequeueReusableCellWithIdentifier:SubscribeCellId];
        if (cell == nil) {
            cell = [[SubscribeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SubscribeCellId];
        }
        ((SubscribeCell *)cell).model = (HomeSubscribeModel *)(modelPart2.tags[indexPath.row]);
        if (indexPath.row == 0) {
            [((SubscribeCell *)cell) hiddenLineView];
        }
    }
    else {
        cell = [[UITableViewCell alloc] init];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tag == 1002) {
        return 60;
    }
    else {
        return 0;
    }
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
