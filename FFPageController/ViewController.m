//
//  ViewController.m
//  FFPageController
//
//  Created by linjianguo on 2018/7/1.
//  Copyright © 2018年 com.justsee. All rights reserved.
//

#import "ViewController.h"
#import <CDDPagerController/DCPagerMacros.h>
@interface ViewController ()

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.selectIndex = 4;//选择第几个设置选中
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"父子控制器";
    [self setupAllChildViewController];
    
    [self setUpDisplayStyle:^(UIColor *__autoreleasing *titleScrollViewBgColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIColor *__autoreleasing *proColor, UIFont *__autoreleasing *titleFont, CGFloat *titleButtonWidth, BOOL *isShowPregressView, BOOL *isOpenStretch, BOOL *isOpenShade) {
        *titleScrollViewBgColor = [UIColor whiteColor]; //标题View背景色（默认标题背景色为白色）
        *norColor = [UIColor darkGrayColor];            //标题未选中颜色（默认未选中状态下字体颜色为黑色）
        *selColor = [UIColor orangeColor];              //标题选中颜色（默认选中状态下字体颜色为红色）
        *proColor = [UIColor purpleColor];              //滚动条颜色（默认为标题选中颜色）
        *titleFont = [UIFont systemFontOfSize:16];      //字体尺寸 (默认fontSize为15)
        
        /*
         以下BOOL值默认都为NO
         */
        *isShowPregressView = YES;                      //是否开启标题下部Pregress指示器
        *isOpenStretch = YES;                           //是否开启指示器拉伸效果
        *isOpenShade = YES;                             //是否开启字体渐变
    }];
    
    [self setUpTitleScale:^(CGFloat *titleScale) { //titleScale范围在0到1之间  <0 或者 > 1 则默认不缩放 默认设置titleScale就开启缩放，不设置则关闭
        *titleScale = 0.1;
    }];
    
    
    [self setUpProgressAttribute:^(CGFloat *progressLength, CGFloat *progressHeight) {//progressLength 设置底部progress指示器的长度，有默认值为按钮的宽度的百分之56  progressHeight默认高度4(并且不能大于10)
        *progressLength = 40;
        *progressHeight = 5;
    }];
    
    
}
- (void)setupAllChildViewController
{
    NSArray *titles = @[@"fengfeng1",@"fengfeng2",@"fengfeng3",@"fengfeng4",@"fengfeng5",@"fengfeng6"];
    for (int i = 0; i < titles.count; i++) {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.title = titles[i];
        vc.view.backgroundColor = RandColor;
        [self addChildViewController:vc];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
