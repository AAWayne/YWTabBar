//
//  YWBaseViewController.m
//  YWLiveDemo
//
//  Created by Yuan Wei on 2019/3/8.
//  Copyright © 2019 阿唯不知道. All rights reserved.
//

#import "YWBaseViewController.h"

@interface YWBaseViewController ()

@end

@implementation YWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIColor * radomcolor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    self.view.backgroundColor = radomcolor;
    
}


@end
