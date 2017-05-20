//
//  SideScrollViewController.m
//  MaoTest
//
//  Created by SG on 2017/3/22.
//  Copyright © 2017年 com.lky.zyt. All rights reserved.
//

#import "SideSwitchViewController.h"


@interface SideSwitchViewController ()<UIPageViewControllerDataSource, UIPageViewControllerDelegate,SSTitleViewDelegate>

@property (nonatomic,strong)UIPageViewController *pageViewController;

@end

@implementation SideSwitchViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor= [UIColor colorWithRed:235 green:235 blue:235 alpha:1];
}

- (instancetype)initViewContollreWithTitles:(NSArray *)titles controllers:(NSArray *)controllers TitleHeight:(CGFloat)height present:(BOOL)isModal{
    assert(titles);
    assert(controllers);
    self = [super init];
    if (self) {
        self.titles= titles;
        self.controllers= controllers;
        [self initializeViewControllerTitleHeight:height present:isModal];

    }
    return self;
}


#pragma mark --初始化页面
- (void)initializeViewControllerTitleHeight:(CGFloat)height present:(BOOL)isModal{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    CGFloat orign = 0;
    if (isModal){
        orign=20;
    }
    if (!height||height<50) {
        height = 50;
    }
   _titleView = [[SSTitleView alloc]initWithFrame:CGRectMake(0,orign, SSMAIN_WIDTH,height) array:self.titles];
    _titleView.delegate= self;
    [self.view addSubview:_titleView];


#pragma mark--UIPageViewController
    NSDictionary *options = @{UIPageViewControllerOptionSpineLocationKey:[NSNumber numberWithInt:UIPageViewControllerSpineLocationMin]};
    _pageViewController  = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
    _pageViewController.view.backgroundColor=[UIColor colorWithRed:235 green:235 blue:235 alpha:1];
    _pageViewController.view.frame = CGRectMake(0,CGRectGetMaxY(self.titleView.frame),SSMAIN_WIDTH, SSMAIN_HEIGHT-CGRectGetMaxY(self.titleView.frame));
    _pageViewController.dataSource = self;
    _pageViewController.delegate = self;
    UIViewController *firstVc = [self.controllers objectAtIndex:0];
    [_pageViewController setViewControllers:@[firstVc] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
}

#pragma mark -- 配置颜色
- (void)updateBackgroundColor:(UIColor *)bgColor  fontNormalColor:(UIColor *)normalColor fontSeletedColor:(UIColor *)seletedColor slideColor:(UIColor *)slideColor{
    self.view.backgroundColor= bgColor;
    _pageViewController.view.backgroundColor= bgColor;
    [_titleView updateBackgroundColor:bgColor fontNormalColor:normalColor fontSeletedColor:seletedColor slideColor:slideColor];
}

#pragma mark --CleanTiViewDelegate点击BUTTON
-(void)titleViewDidSelected:(SSTitleView *)titleView index:(NSInteger)index isBool:(BOOL)isBool{
    UIViewController *viewController = self.controllers[index];
    if (isBool) {
        [_pageViewController setViewControllers:@[viewController] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    }else{
        [_pageViewController setViewControllers:@[viewController] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
    }


}
#pragma mark --UIPageViewControllerDataSource
//向前翻
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{

    NSUInteger index=[self indexOfViewController:viewController];
    // index为0表示已经翻到最前页
    if (index == 0 || index == NSNotFound) return  nil;
    index --;
    return self.controllers[index];

}
//向后翻
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{

    NSUInteger index=[self indexOfViewController:viewController];
    // index为0表示已经翻到最前页
    if (index == NSNotFound || index == self.controllers.count-1)return  nil;
    index++;
    return self.controllers[index];
}

#pragma - mark PageViewController Delegate
// 翻页控制的改进在此处。
-(void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers
{
    // 将要进行动画时才关闭交互，避免上下swipe手势引起永久性失去交互
    [pageViewController.view setUserInteractionEnabled:NO];
}
#pragma - mark #pragma - mark PageViewController 翻页完成后
-(void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    UIViewController  *viewController= _pageViewController.viewControllers[0];
    NSInteger index= [self indexOfViewController:viewController];
    [_titleView updateTitleViewIndex:index];
    // 无论有无翻页，只要动画结束就恢复交互。
    if (finished){
        pageViewController.view.userInteractionEnabled = YES;
    }
}
// 返回当前viewController数据在数组中所处位置
-(NSInteger)indexOfViewController:(UIViewController *)dvc
{
    for (NSInteger i =0; i<self.controllers.count; i++) {
        id vc = self.controllers[i];
        if ([vc isKindOfClass:[dvc class]]) {
            return i;
        }
    }
    return -1;
}



@end
