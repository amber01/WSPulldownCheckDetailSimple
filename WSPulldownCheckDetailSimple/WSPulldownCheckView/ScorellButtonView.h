//
//  ScorellButtonView.h
//  WSScrollButtonSimple
//
//  Created by shlity on 15/10/28.
//  Copyright (c) 2015年 shlity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneTableViewController.h"
#import "TwoTableViewController.h"

@interface ScorellButtonView : UIView<UIScrollViewDelegate>

@property(nonatomic,retain) OneTableViewController *oneVC;
@property(nonatomic,retain) TwoTableViewController *twoVC;

@end
