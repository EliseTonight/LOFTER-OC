//
//  MyselfViewController.m
//  LofterOC
//
//  Created by Elise on 16/8/25.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "MyselfViewController.h"
#import "MyHeadView.h"

@interface MyselfViewController () <UIScrollViewDelegate>

@property (nonatomic,strong) MyHeadView *myHeadView;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIView *shadowView;
@property (nonatomic,strong) UIImageView *backImageView;

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
    [self setMainView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:true animated:false];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:false animated:false];
}

#pragma mark - lazy property

- (UIScrollView *)scrollView {
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:MainBounds];
        _scrollView.delegate = self;
        _scrollView.showsVerticalScrollIndicator = false;
        _scrollView.showsHorizontalScrollIndicator = false;
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.contentSize = CGSizeMake(AppWidth, AppHeight);
    }
    return _scrollView;
}

- (UIView *)shadowView {
    if (_shadowView == nil) {
        _shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, AppWidth, 180)];
        _shadowView.backgroundColor = [UIColor colorWithRed:215/255.0 green:215/255.0 blue:215/255.0 alpha:0.8];
    }
    return _shadowView;
}

- (UIImageView *)backImageView {
    if (_backImageView == nil) {
        _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"HeadB"]];
        _backImageView.frame = CGRectMake(0, 0, AppWidth, 180);
    }
    return _backImageView;
}

#pragma mark - private

- (void)setMainView {
    
    self.myHeadView = [MyHeadView loadMyHeadViewFromXibWithFrame:CGRectMake(0, 0, AppWidth, 431)];
    self.myHeadView.backgroundColor = [UIColor clearColor];
    self.myHeadView.delegate = self;
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.backImageView];
    [self.scrollView addSubview:self.shadowView];
    [self.scrollView addSubview:self.myHeadView];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offY = scrollView.contentOffset.y;
    if (offY < 0) {
        self.backImageView.frame = CGRectMake(offY / 4, offY, AppWidth - (offY / 2), 180 - offY);
        self.shadowView.frame = CGRectMake(offY / 4, offY, AppWidth - (offY / 2), 180 - offY);
        self.shadowView.alpha = 0.8 + (offY * 0.003);
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
