//
//  CommonLoadURLViewController.m
//  LofterOC
//
//  Created by Elise on 16/9/3.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "CommonLoadURLViewController.h"

@interface CommonLoadURLViewController ()

@property (nonatomic,strong) UIWebView *webView;

@end

@implementation CommonLoadURLViewController

#pragma mark - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation];
    [self.view addSubview:self.webView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = false;
    self.tabBarController.tabBar.hidden = true;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = true;
    self.tabBarController.tabBar.hidden = false;
}

#pragma mark - lazy

- (UIWebView *)webView {
    if (_webView == nil) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, AppWidth, AppHeight)];
        _webView.delegate = self;
        _webView.scrollView.showsHorizontalScrollIndicator = false;
        _webView.backgroundColor = [UIColor whiteColor];
    }
    return _webView;
}

#pragma mark - private

- (void)setNavigation {
    [[UINavigationBar appearance] setTintColor:[UIColor darkGrayColor]];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"头部导航_返回"] style:UIBarButtonItemStylePlain target:self action:@selector(backTabBarButtonClick)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"头部导航_更多"] style:UIBarButtonItemStylePlain target:self action:@selector(shareTabBarButtonClick)];
    self.navigationItem.title = @"专栏";
}

- (void)loadViewWithURLString:(NSString *)url {
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}

#pragma mark - action

- (void)backTabBarButtonClick {
    [self.navigationController popViewControllerAnimated:true];
}

- (void)shareTabBarButtonClick {
    
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
