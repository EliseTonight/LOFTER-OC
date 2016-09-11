//
//  DescoverViewController.m
//  LofterOC
//
//  Created by Elise on 16/8/25.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "DescoverViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "AutoScrollView.h"
#import <MJExtension/MJExtension.h>
#import "UIViewController+Extension.h"
#import "LofterRefreshHeader.h"
#import <iCarousel/iCarousel.h>
#import "DescoverScrollImageModel.h"
#import "DescoverMidModel.h"
#import "DescoverTagModel.h"
#import "DescoverExpertModel.h"
#import "ImagePieceView.h"
#import "DescoverTagCell.h"
#import "ExpertView.h"
#import "CommonLoadURLViewController.h"


@interface DescoverViewController () <AutoScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,iCarouselDataSource,iCarouselDelegate,ExpertViewDelegate>
{
    DescoverScrollImageModels *modelPartOne;
    DescoverMidModes *modelPartTwo;
    DescoverTagModels *modelPartThree;
    DescoverExpertModels *modelPartFour;
}

@property (nonatomic,strong) UITableView *mainTabelView;
@property (nonatomic,strong) AutoScrollView *autoScrollView;
@property (nonatomic,strong) UISearchController *topSearchC;
@property (nonatomic,strong) iCarousel *icarouselView;
@property (nonatomic,strong) UIView *HeadView;
@property (nonatomic,strong) ExpertView *expertView;

@end

@implementation DescoverViewController

#pragma mark - lifeCycle

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setTabBarWithTitle:@"发现" withTag:1 withImageStr:@"发现icon_非当前帧" withSelectedImageStr:@"发现icon_当前帧"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:true];
    
    [self setViews];
    
    [self.mainTabelView.mj_header beginRefreshing];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.autoScrollView startTimer];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.autoScrollView endTimer];
}

- (void)dealloc {
    self.icarouselView.delegate = nil;
    self.icarouselView.dataSource = nil;
    [self.icarouselView removeFromSuperview];
}


#pragma mark - lazy property

- (UISearchController *)topSearchC {
    if (_topSearchC == nil) {
        _topSearchC = [[UISearchController alloc] initWithSearchResultsController:nil];
        __weak typeof(self) weakSelf = self;
        _topSearchC.searchResultsUpdater = weakSelf;
        _topSearchC.delegate = weakSelf;
        _topSearchC.searchBar.frame = CGRectMake(0, 0, AppWidth, 50);
        _topSearchC.searchBar.backgroundColor = [UIColor clearColor];
        [_topSearchC.searchBar setBackgroundImage:[UIImage imageNamed:@"searchBG"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
        UITextField *searchTextField = (UITextField *)[_topSearchC.searchBar valueForKey:@"searchField"];
        searchTextField.frame = CGRectMake(8, 8, AppWidth - 16, 34);
        searchTextField.textAlignment = NSTextAlignmentLeft;
        searchTextField.textColor = [UIColor darkGrayColor];
        searchTextField.placeholder = @"搜索标签、用户、标题";
        UIImageView *searchImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_blackBG_icon"]];
        searchImage.frame = CGRectMake(0, 0, 20, 20);
        searchTextField.leftView = searchImage;
        [_topSearchC.searchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"searchdi"] forState:UIControlStateNormal];
    }
    return _topSearchC;
}
- (UITableView *)mainTabelView {
    if (_mainTabelView == nil) {
        _mainTabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, AppWidth, AppHeight - 50 - CGRectGetHeight(self.tabBarController.tabBar.frame)) style:UITableViewStylePlain];
        _mainTabelView.delegate = self;
        _mainTabelView.dataSource = self;
        _mainTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTabelView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    }
    return _mainTabelView;
}
- (AutoScrollView *)autoScrollView {
    if (_autoScrollView == nil) {
        _autoScrollView = [[AutoScrollView alloc] initWithFrame:CGRectMake(0, 0, AppWidth, 160)];
        __weak typeof(self) weakSelf = self;
        _autoScrollView.delegate = weakSelf;
    }
    return _autoScrollView;
}
- (iCarousel *)icarouselView {
    if (_icarouselView == nil) {
        _icarouselView = [[iCarousel alloc] initWithFrame:CGRectMake(AppWidth * 0.15, 170, AppWidth * 0.7, 300)];
        __weak typeof(self) weakSelf = self;
        _icarouselView.delegate = weakSelf;
        _icarouselView.dataSource = weakSelf;
        _icarouselView.type = iCarouselTypeRotary;
        _icarouselView.vertical = false;
        _icarouselView.pagingEnabled = true;
        _icarouselView.bounceDistance = 0.7;
        _icarouselView.decelerationRate = 0.6;
    }
    return _icarouselView;
}
- (ExpertView *)expertView {
    if (_expertView == nil) {
        _expertView = [ExpertView loadExpertViewWithModel:modelPartFour];
        __weak typeof(self) weakSelf = self;
        _expertView.delegate = weakSelf;
    }
    return _expertView;
}

#pragma mark - private


- (void)setViews {
    //设置searchc
    [self.view addSubview:self.topSearchC.searchBar];
    //设置headview
    UIView *signRecommendView = [[UIView alloc] initWithFrame:CGRectMake(0, 480, AppWidth, 25)];
    UILabel *signRecommendLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 15, AppWidth - 16, 10)];
    signRecommendView.backgroundColor = [UIColor whiteColor];
    signRecommendLabel.text = @"标签推荐";
    signRecommendLabel.font = [UIFont systemFontOfSize:15];
    signRecommendLabel.textColor = [UIColor lightGrayColor];
    signRecommendLabel.textAlignment = NSTextAlignmentLeft;
    [signRecommendView addSubview:signRecommendLabel];
    
    self.HeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, AppWidth, 160 + 300 + 10 + 10 + 25)];
    self.HeadView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    [self.HeadView addSubview:self.autoScrollView];
    [self.HeadView addSubview:self.icarouselView];
    [self.HeadView addSubview:signRecommendView];
//    NSLog(@"%f,%f,%f,%f",self.icarouselView.frame.origin.x,self.icarouselView.frame.origin.y,self.icarouselView.frame.size.width,self.icarouselView.frame.size.height);
    //设置tableview
    self.mainTabelView.tableHeaderView = self.HeadView;
    [self setTableRefreshAnimationWithTarget:self refreshAction:@selector(loadDescoverAllModel) gifFrame:CGRectMake((AppWidth - RefreshImage_Width) * 0.5, 0, RefreshImage_Width, RefreshImage_Height)  targetTabelView:self.mainTabelView];
    [self.view addSubview:self.mainTabelView];
    
}

- (void)setTableRefreshAnimationWithTarget:(id)target refreshAction:(SEL)selector gifFrame:(CGRect)frame targetTabelView:(UITableView *)tableView {
    LofterRefreshHeader *refreshHead = [LofterRefreshHeader headerWithRefreshingTarget:target refreshingAction:selector];
    refreshHead.gifView.frame = frame;
    tableView.mj_header = refreshHead;
}



#pragma mark - HTTP

- (void)loadDescoverAllModel {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager POST:DescoverUrl parameters:DescoverUrlParameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSInteger i = 1;
        for (NSDictionary * item in responseObject[@"response"][@"items"]) {
            if (i == 1) {
                DescoverScrollImageModels *model = [DescoverScrollImageModels mj_objectWithKeyValues:item];
                modelPartOne = model;
                self.autoScrollView.model = modelPartOne;
            }
            if (i == 2) {
                DescoverMidModes *model = [DescoverMidModes mj_objectWithKeyValues:item];
                modelPartTwo = model;
                [self.icarouselView reloadData];
            }
            if (i == 3) {
                DescoverTagModels *model = [DescoverTagModels mj_objectWithKeyValues:item];
                modelPartThree = model;
                [self.mainTabelView reloadData];
            }
            if (i == 4) {
                DescoverExpertModels *model = [DescoverExpertModels mj_objectWithKeyValues:item];
                modelPartFour = model;
                self.mainTabelView.tableFooterView = self.expertView;
            }
            i++;
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error is %@",error);
    }];
    [self.mainTabelView.mj_header endRefreshing];
}

#pragma mark - AutoScrollViewDelegate

- (void)autoScrollViewView:(AutoScrollView *)autoScrollView didSelectedAtIndex:(NSInteger)index {
    CommonLoadURLViewController *vc = [[CommonLoadURLViewController alloc] init];
    [vc loadViewWithURLString:((DescoverScrollImageModel *)modelPartOne.item[index]).url];
    [self.navigationController pushViewController:vc animated:true];
}

#pragma mark - UITableViewDataSoure && UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger returnValue = 0;
    if (modelPartThree != nil) {
        returnValue = modelPartThree.item.count;
    }
    return returnValue;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    cell = [DescoverTagCell loadDescoverTagCellFromXibWith:tableView];
    ((DescoverTagCell *)cell).model = modelPartThree.item[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 230;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - iCarouselDataSource && iCarouselDelegate

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    NSInteger returnValue = 0;
    if (modelPartTwo != nil) {
        returnValue = modelPartTwo.item.count;
    }
    return returnValue;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    ImagePieceView *imagePieceView;
    if (view == nil) {
        view = [[UIView alloc] initWithFrame:carousel.frame];
        view.backgroundColor = [UIColor whiteColor];
        
        imagePieceView = [ImagePieceView loadImagePieceViewWithMatchModel:modelPartTwo.item[index] withFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
        imagePieceView.tag = 1;
        [view addSubview:imagePieceView];
    }
    else {
        imagePieceView = (ImagePieceView *)[view viewWithTag:1];
    }
    return view;
}

#pragma mark - ExpertViewDelegate

- (void)expertViewMoreFunButtonClick:(UIButton *)sender {
    
}

- (void)expertViewSingleExpertClick:(SingleExpertView *)tapView {
    
}

- (void)expertViewMoreExpertButtonClick:(UIButton *)sender {
    
}



@end
