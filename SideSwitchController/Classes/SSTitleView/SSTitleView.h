//
//  SSTitleView.h
//  MaoTest
//
//  Created by SG on 2017/3/22.
//  Copyright © 2017年 com.lky.zyt. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SSMAIN_WIDTH              [UIScreen mainScreen].bounds.size.width
#define SSMAIN_HEIGHT             [UIScreen mainScreen].bounds.size.height


@class SSTitleView;
@protocol SSTitleViewDelegate <NSObject>

#pragma mark -- 选择哪一项
-(void)titleViewDidSelected:(SSTitleView *)titleView index:(NSInteger)index isBool:(BOOL)isBool;

@end

@interface SSTitleView : UIView

@property(weak,nonatomic)id<SSTitleViewDelegate> delegate;

#pragma mark -- 初始化并传入标题
- (instancetype)initWithFrame:(CGRect)frame array:(NSArray *)arry;

#pragma mark -- 外部滑动更新标题选项
- (void)updateTitleViewIndex:(NSInteger)index;

#pragma mark -- 配置颜色
//slideColor:滑动条颜色，如果传nil，默认会和标题选中颜色一致
- (void)updateBackgroundColor:(UIColor *)bgColor  fontNormalColor:(UIColor *)normalColor fontSeletedColor:(UIColor *)seletedColor slideColor:(UIColor *)slideColor;


@end

