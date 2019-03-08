//
//  YWTabBar.m
//  YWLiveDemo
//
//  Created by Yuan Wei on 2019/3/8.
//  Copyright © 2019 阿唯不知道. All rights reserved.
//

#import "YWTabBar.h"

@interface YWTabBar ()

@property (nonatomic, strong) NSArray * datalist; // 图标数组

@property (nonatomic, strong) UIButton * lastItem; // 最后选中的按钮

@property (nonatomic, strong) UIImageView * tabBgView; // 自定义TabBar的背景

@property (nonatomic, strong) UIButton * cameraBtn; // 中间相机按钮

@end



@implementation YWTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 设置TabBar背景
        [self addSubview:self.tabBgView];
        
        // 添加TabBar按钮
        for (NSUInteger i = 0; i < self.datalist.count; i ++) {
            UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
            item.tag = YWItemTypeLive + i;
            // 高亮状态时不渲染图片颜色
            item.adjustsImageWhenHighlighted = NO;
            // 设置正常和选中情况下的图标
            [item setImage:[UIImage imageNamed:self.datalist[i]] forState:UIControlStateNormal];
            [item setImage:[UIImage imageNamed:[self.datalist[i] stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            
            [item setTitle:[NSString stringWithFormat:@"按钮-%lu", (unsigned long)i] forState:UIControlStateNormal];
            [item setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [item setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            
            // 设置默认选中的为第一个按钮
            if (i == 0) {
                item.selected = YES;
                self.lastItem = item;
            }
            // 添加点击事件
            [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            // 添加到视图
            [self addSubview:item];
        }
        
        //添加相机按钮
        [self addSubview:self.cameraBtn];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 设置背景视图frame
    self.tabBgView.frame = self.frame;
    
    // 设置中心按钮的frame
    self.cameraBtn.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5 - 20);
    
    // 设置按钮图标的frame
    CGFloat itemW = self.frame.size.width / self.datalist.count;
    for (UIView *item in self.subviews) {
        if (item.tag >= YWItemTypeLive) {
            item.frame = CGRectMake((item.tag-YWItemTypeLive)*itemW, 0, itemW, self.frame.size.height);
        }
    }
    
}


#pragma mark - * * * * * action * * * * *

- (void)clickItem:(UIButton *)sender {
    
    if ([self.delegete respondsToSelector:@selector(tabBarWith:clickIndex:)]) {
        [self.delegete tabBarWith:self clickIndex:sender.tag];
        
    }
    
    if (self.tabBarBlock) {
        self.tabBarBlock(self, sender.tag);
    }
    
    if (sender.tag == YWItemTypeLaunch) {
        return;
    }
    
    //将上一个按钮的选中状态置为NO
    self.lastItem.selected = NO;
    //将正在点击的按钮状态置为YES
    sender.selected = YES;
    //将当前按钮设置成上一个按钮
    self.lastItem = sender;
    
    // 设置先变大再还原的普通动画
    [UIView animateWithDuration:0.2 animations:^{
       // 这里先变大1.2倍
        sender.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        // 变大完成后再还原
        sender.transform = CGAffineTransformIdentity;
    }];
}

#pragma mark - * * * * * getter * * * * *

- (NSArray *)datalist {
    
    if (!_datalist) {
        _datalist = @[@"tab_live",@"tab_me"];
    }
    return _datalist;
}

- (UIButton *)cameraBtn {
    
    if (!_cameraBtn) {
        _cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraBtn setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        [_cameraBtn sizeToFit];
        [_cameraBtn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
        _cameraBtn.tag = YWItemTypeLaunch;
    }
    return _cameraBtn;
}

- (UIImageView *)tabBgView {
    
    if (!_tabBgView) {
        _tabBgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    return _tabBgView;
}

@end
