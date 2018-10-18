//
//  LZJDrawCardViewController.m
//  LZJ-DrawCard
//
//  Created by weima on 2018/10/17.
//  Copyright © 2018年 weima. All rights reserved.
//



#import "LZJDrawCardViewController.h"
#define inset 30
@interface LZJDrawCardViewController ()
@property (nonatomic, strong) NSArray <LZJDrawCardView *> *cards;
@end

@implementation LZJDrawCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = UIColor.clearColor;
    
    _cards = @[
               [[LZJDrawCardView alloc]init],
               [[LZJDrawCardView alloc]init],
               [[LZJDrawCardView alloc]init],
               [[LZJDrawCardView alloc]init],
               [[LZJDrawCardView alloc]init],
               [[LZJDrawCardView alloc]init]
               ];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CGFloat width = (self.view.bounds.size.width - 4*inset) / 3;
        CGFloat height = width /0.62;
        [_cards enumerateObjectsUsingBlock:^(LZJDrawCardView *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self.view addSubview:obj];
            obj.center = self.view.center;
            
            [obj setTapBlock:^(UIView *view) {
                view.backgroundColor = UIColor.whiteColor;
                self.view.userInteractionEnabled = NO;
            }];
            [UIView animateWithDuration:0.6 animations:^{
                obj.backgroundColor = UIColor.redColor;
                obj.frame = CGRectMake(inset + (width + inset)*(idx%3), 200 + (height + inset)*(idx/3), width, height);
                
            }];
        }];
    });
    
    
    
}



@end


#pragma mark - card view
@interface LZJDrawCardView ()
@property (nonatomic, strong) UIImageView *backgroudImageView;
@end

@implementation LZJDrawCardView

- (instancetype)init{
    self = [super init];
    
    if (self) {
        self.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        
        [self addGestureRecognizer:tap];
    }
    
    return self;
}

- (void)tap:(UITapGestureRecognizer *)t{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.35f];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self cache:NO];
    [UIView commitAnimations];

    if (self.tapBlock) {
        self.tapBlock(self);
    }
}

@end
