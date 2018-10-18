//
//  ViewController.m
//  LZJ-DrawCard
//
//  Created by weima on 2018/10/17.
//  Copyright © 2018年 weima. All rights reserved.
//

#import "ViewController.h"
#import "LZJDrawCardController/LZJDrawCardViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = UIColor.grayColor;
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 200, 100, 50)];
    
    [button setTitleColor:UIColor.blueColor forState:(UIControlStateNormal)];
    [button setTitle:@"选择" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(showDrawCard) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:button];
}

- (void)showDrawCard{
    LZJDrawCardViewController *vc = [[LZJDrawCardViewController alloc]init];
    
    vc.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext|UIModalPresentationFullScreen;
    [vc setContent:@"有六张神秘奖励卡牌，可任意点击一张卡牌抽取奖励，只有一次机会哦，祝您好运"];
    [self presentViewController:vc animated:NO completion:^{
        
    }];
}


@end
