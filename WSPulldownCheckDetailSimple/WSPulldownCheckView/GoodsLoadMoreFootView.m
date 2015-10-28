//
//  GoodsLoadMoreFootView.m
//  NavigationItemDemo
//
//  Created by shlity on 15/10/28.
//  Copyright (c) 2015年 amber. All rights reserved.
//

#define COLOR_BUTTON_NEW1 [UIColor colorWithRed:223/255.0f green:223/255.0f blue:223/255.0f alpha:1.0]
#define COLOR_CELL_NEW   [UIColor colorWithRed:242 / 255.0 green:242 / 255.0 blue:242 / 255.0 alpha:1.0]

#import "GoodsLoadMoreFootView.h"

@implementation GoodsLoadMoreFootView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView  *moreView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        moreView.backgroundColor = COLOR_CELL_NEW;
        
        UIView *leftLine = [[UIView alloc]initWithFrame:CGRectMake(10, moreView.frame.size.height/2-0.25, frame.size.width/4-5, 0.5)];
        leftLine.backgroundColor = COLOR_BUTTON_NEW1;
        UIView *rightLine = [[UIView alloc]initWithFrame:CGRectMake(frame.size.width-leftLine.frame.size.width-10, moreView.frame.size.height/2-0.25, frame.size.width/4-5, 0.5)];
        rightLine.backgroundColor = COLOR_BUTTON_NEW1;
        UILabel *moreLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, moreView.frame.size.height/2-10, frame.size.width, 20)];
        moreLabel.text = @"上拉，查看图文详情";
        moreLabel.textAlignment = NSTextAlignmentCenter;
        moreLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
        
        [moreView addSubview:leftLine];
        [moreView addSubview:rightLine];
        [moreView addSubview:moreLabel];
        [self addSubview:moreView];
    }
    return self;
}

@end
