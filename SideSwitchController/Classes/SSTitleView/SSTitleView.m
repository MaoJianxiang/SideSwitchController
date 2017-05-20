//
//  SSTitleView.m
//  MaoTest
//
//  Created by SG on 2017/3/22.
//  Copyright © 2017年 com.lky.zyt. All rights reserved.
//

#import "SSTitleView.h"

@interface SSTitleView()
@property (nonatomic,assign) CGFloat height;
@property(assign,nonatomic)NSInteger count;
@property(strong,nonatomic)UIView *currentView;
@property(assign,nonatomic)NSInteger currentCount;
@end

@implementation SSTitleView

-(instancetype)initWithFrame:(CGRect)frame array :(NSArray *)arry{
    self = [super initWithFrame:frame];
    self.count= arry.count;
    self.height= frame.size.height;
    if (self) {
        self.backgroundColor=[UIColor colorWithRed:235 green:235 blue:235 alpha:1];
        CGFloat itemWith =  SSMAIN_WIDTH/arry.count;
        CGFloat multiple =  0.05*arry.count+0.7;
        CGFloat interval= (itemWith - multiple*itemWith)/2;
        for (NSInteger i =0; i< arry.count; i++) {
            UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(interval+itemWith*i,0,multiple*itemWith,self.height-2)];
            [button setTitle:arry[i] forState:UIControlStateNormal];
            button.titleLabel.adjustsFontSizeToFitWidth=YES;
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
            if (i ==0) {
                button.selected =YES;
            }
            button.tag = 200+i;
            [button addTarget:self action:@selector(buttonTaped:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            [button.titleLabel sizeToFit];
        }
        _currentView= [[UIView alloc]initWithFrame:CGRectMake(interval,self.height-2, multiple*itemWith,2)];
        _currentView.backgroundColor = [UIColor blackColor];
        [self addSubview:_currentView];
        self.currentCount = 0;
    }
    return self;
}
#pragma mark --点击button
-(void)buttonTaped:(UIButton *)sender{
    //判断是否点了未选中的按钮
    NSInteger index = sender.tag -200;
    if (index == _currentCount) {
        return;//如果选择了当前的BUTTON,那就不执行操作；
    }
    //设置bool值来判断是左滑还是右滑
    BOOL isYES = NO;
    if (_currentCount < index) {
        isYES = YES;
    }
    //把选择的button进行切换
    for (NSInteger i = 0; i<self.count; i ++) {
        UIButton *button = (UIButton *)[self viewWithTag:200+i];
        if (button.selected) {
            button.selected = NO;
        }
    }
    sender.selected =YES;
    //把view也进行动画
    CGRect frame = _currentView.frame;
    CGFloat itemWith =  SSMAIN_WIDTH/self.count;
    CGFloat multiple =  0.05*self.count+0.7;
    CGFloat interval= (itemWith - multiple*itemWith)/2;
    frame.origin.x =interval+ itemWith*index;
    [UIView animateWithDuration:0.1 animations:^{
        _currentView.frame = frame;
    }];
    //最后将当前的项更新
    _currentCount= index;
    //用代理切换视图
    if (self.delegate &&[self.delegate respondsToSelector:@selector(titleViewDidSelected:index:isBool:)]) {
        [self.delegate titleViewDidSelected:self index:index isBool:isYES];
    }

}
#pragma mark--更新self的选项
-(void)updateTitleViewIndex:(NSInteger)index{
    _currentCount=index;
    for (NSInteger i =0; i<self.count; i++) {
        UIButton *button = (UIButton *)[self viewWithTag:200+i];
        if (button.selected) {
            button.selected = NO;
        }
    }
    UIButton *button =(UIButton *)[self viewWithTag:200 + index];
    button.selected = YES;
    //把view也进行动画
    CGRect frame = _currentView.frame;
    CGFloat itemWith =  SSMAIN_WIDTH/self.count;
    CGFloat multiple =  0.05*self.count+0.7;
    CGFloat interval= (itemWith - multiple*itemWith)/2;
    frame.origin.x =interval+ itemWith*index;
    [UIView animateWithDuration:0.1 animations:^{
        _currentView.frame = frame;
    }];
}
#pragma mark -- 配置颜色
- (void)updateBackgroundColor:(UIColor *)bgColor  fontNormalColor:(UIColor *)normalColor fontSeletedColor:(UIColor *)seletedColor slideColor:(UIColor *)slideColor{
    //设置背景颜色
    self.backgroundColor = bgColor;

    //设置按钮字体颜色
    for (NSInteger i =0; i<self.count; i++) {
        UIButton *button = (UIButton *)[self viewWithTag:200+i];
        [button setTitleColor:normalColor forState:UIControlStateNormal];
        [button setTitleColor:seletedColor forState:UIControlStateSelected];
    }

    //滑动条的颜色
    if (slideColor) {
        _currentView.backgroundColor= slideColor;
    }else{
        _currentView.backgroundColor = seletedColor;
    }


}

@end
