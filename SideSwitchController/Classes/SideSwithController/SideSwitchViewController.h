//
//  SideScrollViewController.h
//  MaoTest
//
//  Created by SG on 2017/3/22.
//  Copyright © 2017年 com.lky.zyt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSTitleView.h"

@interface SideSwitchViewController : UIViewController

@property (nonatomic, strong) SSTitleView *titleView;
@property (nonatomic, strong) NSArray *titles;
@property(strong,nonatomic)NSArray *controllers;

#pragma mark -- 配置好titles和controllers之后，再生成视图控制器
// 注意：controllers:千万不能传同类型的Controller,不然会出错。

/*
 *isModal: 是否是模态推出，可以传nil 默认是导航栏推出
 *height:自定义高度，如果不传或者小于50都会默认为50
 */
- (void)initializeViewControllerTitleHeight:(CGFloat)height present:(BOOL)isModal;

/*
 *可一次性生成
 *titles: 需要传入标题数组
 *controllers:需要传入控制器数组
 */
- (instancetype)initViewContollreWithTitles:(NSArray *)titles controllers:(NSArray *)controllers TitleHeight:(CGFloat)height present:(BOOL)isModal;

/*配置颜色 默认：背景为白色，字体normal:为灰色，字体选中Selected:黑色，滑动条颜色黑色。
 *bgColor:背景颜色
 *normalColor:标题颜色
 *seletedColor:标题选中颜色
 *slideColor滑动条颜色，传nil时会默认和标题选中颜色一致
 */
- (void)updateBackgroundColor:(UIColor *)bgColor  fontNormalColor:(UIColor *)normalColor fontSeletedColor:(UIColor *)seletedColor slideColor:(UIColor *)slideColor;


@end
