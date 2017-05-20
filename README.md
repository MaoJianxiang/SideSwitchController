# SideSwitchController

[![CI Status](http://img.shields.io/travis/15208105440@163.com/SideSwitchController.svg?style=flat)](https://travis-ci.org/15208105440@163.com/SideSwitchController)
[![Version](https://img.shields.io/cocoapods/v/SideSwitchController.svg?style=flat)](http://cocoapods.org/pods/SideSwitchController)
[![License](https://img.shields.io/cocoapods/l/SideSwitchController.svg?style=flat)](http://cocoapods.org/pods/SideSwitchController)
[![Platform](https://img.shields.io/cocoapods/p/SideSwitchController.svg?style=flat)](http://cocoapods.org/pods/SideSwitchController)

## 说明

SSTitleView是标题栏，可以单独进行配置。而侧滑是由SideSwitchViewController来完成的。


## 用法

1.可以先预先配置好标题titles和控制器controllers，它们可以通过属性赋值。

@property (nonatomic, strong) NSArray *titles;
@property(strong,nonatomic)NSArray *controllers;

再生成控制器:
/*
*isModal: 是否是模态推出，可以传nil 默认是导航栏推出
*height:自定义高度，如果不传或者小于50都会默认为50
*/
- (void)initializeViewControllerTitleHeight:(CGFloat)height present:(BOOL)isModal;

2.直接生成控制器

/*
*titles: 需要传入标题数组
*controllers:需要传入控制器数组
*/
- (instancetype)initViewContollreWithTitles:(NSArray *)titles controllers:(NSArray *)controllers TitleHeight:(CGFloat)height present:(BOOL)isModal;

3.配置显示的颜色

/*配置颜色 默认：背景为白色，字体normal:为灰色，字体选中Selected:黑色，滑动条颜色黑色。
*bgColor:背景颜色
*normalColor:标题颜色
*seletedColor:标题选中颜色
*slideColor滑动条颜色，传nil时会默认和标题选中颜色一致
*/
- (void)updateBackgroundColor:(UIColor *)bgColor  fontNormalColor:(UIColor *)normalColor fontSeletedColor:(UIColor *)seletedColor slideColor:(UIColor *)slideColor;

## 例如

1.初始化两个子视图控制器

Slide1ViewController *slide1 = [[Slide1ViewController alloc]init];
Slide2ViewController *slide2 = [[Slide2ViewController alloc] init];

2.初始化SideSwitchController

//present:YES 模态推出
SideSwitchController *sideSwitchController = [[SideScrollViewController alloc] initViewContollreWithTitles:@[@"销售管理",@"明天管理"] controllers:@[slide1,slide2] TitleHeight:0 present:YES];

3. 配置颜色

[sideSwitchController updateBackgroundColor:[UIColor colorWithRed:200 green:200 blue:200 alpha:1] fontNormalColor:[UIColor yellowColor] fontSeletedColor:[UIColor brownColor] slideColor:[UIColor  blackColor]];

4. 推出控制器
[self presentViewController:sideSwitchController animated:YES completion:nil];



```ruby
pod "SideSwitchController"
```

## Author

毛建祥, 15208105440@163.com

## License


SideSwitchController is available under the MIT license. See the LICENSE file for more info.
