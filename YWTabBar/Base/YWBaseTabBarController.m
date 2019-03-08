//
//  YWBaseTabBarController.m
//  YWLiveDemo
//
//  Created by Yuan Wei on 2019/3/8.
//  Copyright © 2019 阿唯不知道. All rights reserved.
//

#import "YWBaseTabBarController.h"
#import "YWBaseNavViewController.h"
#import "YWLiveVc.h"

#import "YWTabBar.h"

@interface YWBaseTabBarController () <YWTabBarDelegate>

/** 自定义TabBar */
@property (nonatomic, strong) YWTabBar    *ywTabBar;

@end

@implementation YWBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 加载各个模块的控制器
    [self configViewControllers];
    
    // 加载自定义TabBar
    [self.tabBar addSubview:self.ywTabBar];
    
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];

}


// 加载各个模块的控制器
- (void)configViewControllers {
    
    // vc数组
    NSMutableArray *vcArray = [NSMutableArray arrayWithObjects:@"YWHomeVc", @"YWMineVc", nil];
    
    for (NSUInteger i = 0; i < vcArray.count; i ++) {
        
        NSString *vcName = vcArray[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
        YWBaseNavViewController *navVC = [[YWBaseNavViewController alloc] initWithRootViewController:vc];
        [vcArray replaceObjectAtIndex:i withObject:navVC];
    }
    
    self.viewControllers = vcArray;
    
}


#pragma mark - * * * * * 实现YWTabBarDelegate代理方法 * * * * *

- (void)tabBarWith:(nonnull YWTabBar *)tabBar clickIndex:(YWItemType)idx {
    
    if (idx != YWItemTypeLaunch) {
        // 设置当前选中TabBar的索引
        self.selectedIndex = idx - YWItemTypeLive;
        return;
    }
    YWLiveVc * launchVC = [[YWLiveVc alloc] init];
    [self presentViewController:launchVC animated:YES completion:nil];
    
}

- (YWTabBar *)ywTabBar {
    if (!_ywTabBar) {
        
        CGFloat tabBarH = IPHONE_X ? 83 : 49; // iPhoneX tabbar为49+34
        _ywTabBar = [[YWTabBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, tabBarH)];
        _ywTabBar.delegete = self;
    }
    return _ywTabBar;
}
@end
