//
//  AutoScrollView.m
//  LofterOC
//
//  Created by Elise on 16/8/26.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "AutoScrollView.h"
#import "UIImageView+WebCache.h"

@interface AutoScrollView () <UIScrollViewDelegate>
{
    //计时器
    NSTimer *timer;
    //缓存的三个图片数组
    NSMutableArray *imageThreeArray;
    //所有的图片数组
    NSMutableArray *imageArray;
    
}

@property (nonatomic,strong) UIImageView *leftImageView;
@property (nonatomic,strong) UIImageView *currentImageView;
@property (nonatomic,strong) UIImageView *rightImageView;
@property (nonatomic) NSInteger currentIndex;
//lazy属性
@property (nonatomic,strong) UIScrollView *headScrollView;
@property (nonatomic,strong) UIPageControl *pageControl;


@end

@implementation AutoScrollView

#pragma mark - lifeCycle

- (instancetype)init {
    self = [super init];
    if (self) {
        self.currentIndex = 0;

        //添加视图
        [self addSubview:self.headScrollView];
        [self addSubview:self.pageControl];
        //添加kvo
        [self addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:CurrentIndexContextKVO];
        [self addObserver:self forKeyPath:@"model" options:NSKeyValueObservingOptionNew context:AutoScrollViewModelContextKVO];
        [self initImage];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.currentIndex = 0;

        //添加视图
        [self addSubview:self.headScrollView];
        [self addSubview:self.pageControl];
        //添加kvo
        [self addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:CurrentIndexContextKVO];
        [self addObserver:self forKeyPath:@"model" options:NSKeyValueObservingOptionNew context:AutoScrollViewModelContextKVO];
        [self initImage];
        
    }
    return self;
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (context == CurrentIndexContextKVO) {
        NSInteger newValue = [[change objectForKey:NSKeyValueChangeNewKey] integerValue];
        if (newValue > (imageArray.count - 1)) {
            self.currentIndex = 0;
        }
        if (newValue < 0) {
            self.currentIndex = imageArray.count - 1;
        }
        if ([self.delegate respondsToSelector:@selector(autoScrollViewImageDidChange:)]) {
            [self.delegate autoScrollViewImageDidChange:newValue];
        }
    }
    if (context == AutoScrollViewModelContextKVO) {
        //初始化数组
        imageArray = [[NSMutableArray alloc] init];
        imageThreeArray = [[NSMutableArray alloc] initWithObjects:@"0",@"0",@"0",nil];
        self.currentIndex = 0;
        
        DescoverScrollImageModels *newModel = (DescoverScrollImageModels*)[change objectForKey:NSKeyValueChangeNewKey];
        NSInteger itemNumber = newModel.item.count;
        if (itemNumber == 1) {
            self.headScrollView.scrollEnabled = false;
        }
        self.pageControl.numberOfPages = itemNumber;
        for (int i = 0;i < itemNumber;i++) {
            DescoverScrollImageModel *model = (DescoverScrollImageModel *)newModel.item[i];
            [imageArray addObject:model.img];
        }
        [self reloadImage];
    }
}

#pragma mark - lazy

- (UIScrollView *)headScrollView {
    if (_headScrollView == nil) {
        _headScrollView = [[UIScrollView alloc] init];
        _headScrollView.delegate = self;
        _headScrollView.contentSize = CGSizeMake(self.frame.size.width * 3.0, self.frame.size.height);
        _headScrollView.showsVerticalScrollIndicator = false;
        _headScrollView.showsHorizontalScrollIndicator = false;
        _headScrollView.pagingEnabled = true;
        _headScrollView.contentOffset = CGPointMake(self.frame.size.width, 0);
    }
    return _headScrollView;
}
- (UIPageControl *)pageControl {
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.hidesForSinglePage = true;
    }
    return _pageControl;
}

#pragma mark - override

- (void)layoutSubviews {
    [super layoutSubviews];
    self.headScrollView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.pageControl.frame = CGRectMake(0, self.frame.size.height * 0.9, self.frame.size.width, self.frame.size.height * 0.1);
}


#pragma mark - public 

- (void)hiddenPageController {
    self.pageControl.hidden = true;
}

- (void)showPageController {
    self.pageControl.hidden = false;
}

- (NSInteger)getCurrentIndex {
    return self.currentIndex;
}

- (void)startTimer {
    timer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(autoChangeImage) userInfo:nil repeats:true];
}

- (void)endTimer {
    [timer invalidate];
    timer = nil;
}

#pragma mark - private

- (void)autoChangeImage {
    self.currentIndex = self.currentIndex + 1;
    [UIView animateWithDuration:3.0 animations:^{
        [self.headScrollView setContentOffset:CGPointMake(self.frame.size.width * 2, 0) animated:false];
    } completion:^(BOOL finished) {
        [self reloadImage];
        [self.headScrollView setContentOffset:CGPointMake(self.frame.size.width, 0) animated:false];
    }];
}

- (UIImageView *)setSingleImageViewWithNum:(CGFloat)num {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width * num, 0, self.frame.size.width, self.frame.size.height)];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick:)];
    imageView.userInteractionEnabled = true;
    [imageView addGestureRecognizer:tap];
    return imageView;
}

- (void)initImage {
    self.leftImageView = [self setSingleImageViewWithNum:0];
    self.currentImageView = [self setSingleImageViewWithNum:1];
    self.rightImageView = [self setSingleImageViewWithNum:2];
    [self.headScrollView addSubview:self.leftImageView];
    [self.headScrollView addSubview:self.currentImageView];
    [self.headScrollView addSubview:self.rightImageView];
}

- (void)reloadImage {
    self.pageControl.currentPage = self.currentIndex;
    [self setCurrentImageThreeArray:self.currentIndex];
    [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:imageThreeArray[0]] placeholderImage:[UIImage imageNamed:@"quesheng"]];
    [self.currentImageView sd_setImageWithURL:[NSURL URLWithString:imageThreeArray[1]] placeholderImage:[UIImage imageNamed:@"quesheng"]];
    [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:imageThreeArray[2]] placeholderImage:[UIImage imageNamed:@"quesheng"]];
    
}

- (void)setCurrentImageThreeArray:(NSInteger)currentIndex {
    NSInteger left = currentIndex - 1;
    NSInteger right = currentIndex + 1;
    if (left < 0) {
        left = imageArray.count - 1;
    }
    if (right >= imageArray.count) {
        right = 0;
    }
    imageThreeArray[0] = imageArray[left];
    imageThreeArray[1] = imageArray[currentIndex];
    imageThreeArray[2] = imageArray[right];
}


#pragma mark - targetAction

- (void)imageClick:(UITapGestureRecognizer *)tap {
    if ([self.delegate respondsToSelector:@selector(autoScrollViewView:didSelectedAtIndex:)]) {
        [self.delegate autoScrollViewView:self didSelectedAtIndex:self.currentIndex];
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat offSetX = scrollView.contentOffset.x;
    if (offSetX < (self.frame.size.width * 0.7)) {
        self.currentIndex = self.currentIndex - 1;
        [self reloadImage];
        [self.headScrollView setContentOffset:CGPointMake(self.frame.size.width, 0) animated:false];
    }
    else if (offSetX > (self.frame.size.width * 1.3)) {
        self.currentIndex = self.currentIndex + 1;
        [self reloadImage];
        [self.headScrollView setContentOffset:CGPointMake(self.frame.size.width, 0) animated:false];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self endTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self startTimer];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
