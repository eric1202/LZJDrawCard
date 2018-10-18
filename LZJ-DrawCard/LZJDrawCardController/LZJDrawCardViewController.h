//
//  LZJDrawCardViewController.h
//  LZJ-DrawCard
//
//  Created by weima on 2018/10/17.
//  Copyright © 2018年 weima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZJDrawCardView : UIView

@property (nonatomic,copy) void (^tapBlock)(UIView *view);

@end

@interface LZJDrawCardViewController : UIViewController

@end


