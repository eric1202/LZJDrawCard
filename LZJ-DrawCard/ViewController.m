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
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 200, 100, 50)];
    
    [button setTitleColor:UIColor.blueColor forState:(UIControlStateNormal)];
    [button setTitle:@"选择" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(showDrawCard) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:button];
}

- (void)showDrawCard{
    LZJDrawCardViewController *vc = [[LZJDrawCardViewController alloc]init];
    vc.modalPresentationStyle = UIModalPresentationCurrentContext;
    [self presentViewController:vc animated:NO completion:^{
        
    }];
}


@end
