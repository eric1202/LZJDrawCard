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
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIView *cardsContainerView;


@end

@implementation LZJDrawCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        [UIView animateWithDuration:0.3 animations:^{
    //            self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
    //        }];
    //    });
    
    
    [self addCards];
    [self addCancelButton];
    
}

- (void)setContent:(NSString *)content{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, 240, self.view.frame.size.width-60, 60)];
    label.text = content;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = UIColor.whiteColor;
    label.numberOfLines = 2;
    [self.view addSubview:label];
}

- (void)addCancelButton{
    self.cancelButton = [[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width-60)/2, self.cardsContainerView.frame.size.height+self.cardsContainerView.frame.origin.y+50, 60, 60)];
    
    [self.cancelButton setBackgroundColor:UIColor.greenColor];
    [self.cancelButton addTarget:self action:@selector(dismissModalViewControllerAnimated:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:self.cancelButton];
}

- (void)addCards{
    CGFloat width = (self.view.bounds.size.width - 4*inset) / 3;
    CGFloat height = width /0.7;
    
    self.cardsContainerView = [[UIView alloc]initWithFrame:CGRectMake(0, 300,self.view.bounds.size.width , ceil(height+inset)*2)];
    
    self.cardsContainerView.userInteractionEnabled = YES;
    [self.view addSubview:self.cardsContainerView];
    
    _cards = @[
               [[LZJDrawCardView alloc]init],
               [[LZJDrawCardView alloc]init],
               [[LZJDrawCardView alloc]init],
               [[LZJDrawCardView alloc]init],
               [[LZJDrawCardView alloc]init],
               [[LZJDrawCardView alloc]init]
               ];
    
    [_cards enumerateObjectsUsingBlock:^(LZJDrawCardView *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        
        [self.cardsContainerView addSubview:obj];
        obj.center = CGPointMake(self.cardsContainerView.frame.size.width/2, self.cardsContainerView.frame.size.height/2);
        
        [obj setTapBlock:^(UIView *view) {
            view.backgroundColor = UIColor.whiteColor;
            self.cardsContainerView.userInteractionEnabled = NO;
        }];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.33 delay:idx*0.1 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
                obj.backgroundColor = UIColor.redColor;
                obj.frame = CGRectMake(inset + (width + inset)*(idx%3),(height + inset)*(idx/3), width, height);
            } completion:^(BOOL finished) {
                
            }];
        });
        
        
    }];
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
