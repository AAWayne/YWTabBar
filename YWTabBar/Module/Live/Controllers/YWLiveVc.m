//
//  YWLiveVc.m
//  YWLiveDemo
//
//  Created by Yuan Wei on 2019/3/8.
//  Copyright © 2019 阿唯不知道. All rights reserved.
//

#import "YWLiveVc.h"

@interface YWLiveVc ()

@end

@implementation YWLiveVc

- (IBAction)dissmissVC:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //self.title = @"开始直播";
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
