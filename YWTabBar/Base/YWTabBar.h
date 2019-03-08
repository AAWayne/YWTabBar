//
//  YWTabBar.h
//  YWLiveDemo
//
//  Created by Yuan Wei on 2019/3/8.
//  Copyright © 2019 阿唯不知道. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YWTabBar;

NS_ASSUME_NONNULL_BEGIN

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

typedef enum : NSUInteger {
    YWItemTypeLaunch = 10, // 中间按钮
    YWItemTypeLive = 100, // 直播主页
    YWItemTypeMe, //我的界面
} YWItemType;

@protocol YWTabBarDelegate <NSObject>


- (void)tabBarWith:(YWTabBar *)tabBar clickIndex:(YWItemType)idx;


@end

@interface YWTabBar : UIView

/** 回调 */
@property (nonatomic, copy) void (^tabBarBlock)(YWTabBar *tabBar, YWItemType idx);

/** 代理 */
@property (nonatomic, weak) id<YWTabBarDelegate>     delegete;


@end

NS_ASSUME_NONNULL_END
