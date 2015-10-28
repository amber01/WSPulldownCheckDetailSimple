
//
//  GoodsLoadMoreTopView.m
//  NavigationItemDemo
//
//  Created by shlity on 15/10/28.
//  Copyright (c) 2015年 amber. All rights reserved.
//

#import "GoodsLoadMoreTopView.h"
#import "UIViewExt.h"

@implementation GoodsLoadMoreTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.pulldownView = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width/2-11, 10, 22, 22)];
        [self.pulldownView setImage:[UIImage imageNamed:@"pulldown_icon"]];
        
        self.pullTextLabe = [[UILabel alloc]initWithFrame:CGRectMake(0, _pulldownView.bottom+3,frame.size.width, 20)];
        _pullTextLabe.text = @"下拉,返回商品详情";
        _pullTextLabe.font = [UIFont systemFontOfSize:14];
        _pullTextLabe.textAlignment = NSTextAlignmentCenter;
        _pullTextLabe.textColor = [UIColor grayColor];
        
        [self addSubview:_pulldownView];
        [self addSubview:_pullTextLabe];
    }
    return self;
}

@end
