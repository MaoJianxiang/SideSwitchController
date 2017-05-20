//
//  MMViewController.m
//  SideSwitchController
//
//  Created by 15208105440@163.com on 05/20/2017.
//  Copyright (c) 2017 15208105440@163.com. All rights reserved.
//

#import "MMViewController.h"
#import "SideSwitchViewController.h"
#import "Slide1ViewController.h"
#import "Slide2ViewController.h"


@interface MMViewController ()

@end

@implementation MMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

#pragma mark - 点击跳转过去

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //    SideSwitchViewController *c= [[SideSwitchViewController alloc]init];
    //    sideSwitchViewController.titles= @[@"子视图1",@"子视图2"];
    Slide1ViewController *slide1 = [[Slide1ViewController alloc]init];
    Slide2ViewController *slide2 = [[Slide2ViewController alloc] init];
    
    SideSwitchViewController *sideSwitchController = [[SideSwitchViewController alloc] initViewContollreWithTitles:@[@"子视图1",@"子视图2"] controllers:@[slide1,slide2] TitleHeight:0 present:YES];
    
    //    sideSwitchController.controllers=@[slide1,slide2];
    //    [sideSwitchController initializeViewControllerTitleHeight:1 present:nil];
    sideSwitchController.title=@"切换";
    
    //    //配置颜色
    //    [sideSwitchController updateBackgroundColor:[UIColor colorWithRed:200 green:200 blue:200 alpha:1] fontNormalColor:[UIColor yellowColor] fontSeletedColor:[UIColor brownColor] slideColor:[UIColor  blackColor]];
    
    [self presentViewController:sideSwitchController animated:YES completion:nil];
    
    //    [self.navigationController pushViewController:sideSwitchController animated:nil];
    
}

@end
