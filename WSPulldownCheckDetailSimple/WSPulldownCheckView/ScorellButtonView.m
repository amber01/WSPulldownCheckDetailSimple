
//
//  ScorellButtonView.m
//  WSScrollButtonSimple
//
//  Created by shlity on 15/10/28.
//  Copyright (c) 2015年 shlity. All rights reserved.
//

#import "ScorellButtonView.h"
#import "OneTableViewController.h"
#import "TwoTableViewController.h"

#define TEXT_COLOR [UIColor colorWithRed:255/255.0 green:85/255.0 blue:8/255.0 alpha:1.0]
#define LINE_COLOR [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0]

@implementation ScorellButtonView
{
    UIScrollView *_scrollView;
    UIButton *btn1;
    UIButton *btn2;
    int currPage;
    UIView *line;
    long isShow;
    long isShow2;
    CGRect  _frame;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _frame = frame;
        btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 64, frame.size.width/2, 40)];
        btn1.backgroundColor = [UIColor whiteColor];
        btn1.titleLabel.font = [UIFont fontWithName:@"Helvetica-bold" size:19];
        [btn1 setTitleColor:[UIColor colorWithRed:139/255.0 green:143/255.0 blue:150/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn1 setTitle:@"图文详情" forState:UIControlStateNormal];
        [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn1 setTitle:@"图文详情" forState:UIControlStateSelected];
        [btn1 setTitleColor:TEXT_COLOR forState:UIControlStateSelected];
        [self addSubview:btn1];
        btn1.selected = YES;
        [self setBorderWithView:btn1 top:NO left:NO bottom:YES right:NO borderColor:LINE_COLOR borderWidth:1.f];
        [btn1 addTarget:self action:@selector(showValidCoupon:) forControlEvents:UIControlEventTouchUpInside];
        currPage = 0;
        
        btn2 = [[UIButton alloc] initWithFrame:CGRectMake(btn1.frame.size.width, 64, self.frame.size.width/2, 40)];
        btn2.backgroundColor = [UIColor whiteColor];
        btn2.titleLabel.font = [UIFont fontWithName:@"Helvetica-bold" size:19];
        [btn2 setTitle:@"商品评论" forState:UIControlStateNormal];
        [btn2 setTitleColor:[UIColor colorWithRed:139/255.0 green:143/255.0 blue:150/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn2 setTitle:@"商品评论" forState:UIControlStateSelected];
        [btn2 setTitleColor:TEXT_COLOR forState:UIControlStateSelected];
        [self setBorderWithView:btn2 top:NO left:NO bottom:YES right:NO borderColor:LINE_COLOR borderWidth:1.f];
        [self addSubview:btn2];
        [btn2 addTarget:self action:@selector(showInvalidCoupon:) forControlEvents:UIControlEventTouchUpInside];
        
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40 + 64, frame.size.width, frame.size.height-40-64)];
        _scrollView.alwaysBounceVertical = NO;
        _scrollView.alwaysBounceHorizontal = YES;  //是否可水平滚动 同时设置bounces=YES
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.tag = 3;
        _scrollView.delegate = self;
        _scrollView.bounces = YES;
        _scrollView.pagingEnabled = YES;
        _scrollView.scrollEnabled = YES;
        _scrollView.directionalLockEnabled = YES;
        _scrollView.contentSize = CGSizeMake(frame.size.width*2, _scrollView.frame.size.height);
        [self addSubview:_scrollView];
        isShow = -1;
        isShow2 = -1;
        
        
        self.oneVC = [[OneTableViewController alloc]init];
        self.twoVC = [[TwoTableViewController alloc]init];
        
        _oneVC.tableView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height-64-40);
        _twoVC.tableView.frame = CGRectMake(frame.size.width, 0, frame.size.width, frame.size.height-64-40);
        [_scrollView addSubview:_oneVC.tableView];
        [_scrollView addSubview:_twoVC.tableView];
        
        line = [[UIView alloc] initWithFrame:CGRectMake(0, 38+64, btn1.frame.size.width, 2)];
        line.backgroundColor = TEXT_COLOR;
        [self addSubview:line];

    }
    return self;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.tag == 3) {
        float k = scrollView.contentOffset.x/scrollView.frame.size.width;
        //line.center = CGPointMake(self.view.frame.size.width/3.0+self.view.frame.size.width/3.0*k, line.center.y);
        line.frame = CGRectMake(_frame.size.width/2.0*k, 38+64, btn1.frame.size.width, 2);
        
        CGFloat pageWidth = scrollView.frame.size.width;
        int page = floor((scrollView.contentOffset.x - pageWidth / 3) / pageWidth) + 1;
        if (currPage != page) {
            currPage = page;
            if (currPage == 0) {
                btn1.selected = YES;
                btn2.selected = NO;
            }else if (currPage == 1){
                btn2.selected = YES;
                btn1.selected = NO;
            }
        }
    }
}
-(void)showValidCoupon:(UIButton*)btn
{
    if (btn.selected) {
        return;
    }else{
        btn.selected = YES;
        btn2.selected = NO;
        [_scrollView scrollRectToVisible:CGRectMake(0, 0, _scrollView.frame.size.width, _scrollView.frame.size.height) animated:YES];
    }
}

-(void)showInvalidCoupon:(UIButton*)btn
{
    if (btn.selected) {
        return;
    }else{
        btn.selected = YES;
        btn1.selected = NO;
        [_scrollView scrollRectToVisible:CGRectMake(_scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height) animated:YES];
    }
}

-(void)showInvalidCoupon3:(UIButton*)btn
{
    if (btn.selected) {
        return;
    }else{
        btn.selected = YES;
        btn1.selected = NO;
        btn2.selected = NO;
        [_scrollView scrollRectToVisible:CGRectMake(_scrollView.frame.size.width*2, 0, _scrollView.frame.size.width, _scrollView.frame.size.height) animated:YES];
    }
}

//
- (void)setBorderWithView:(UIView *)view top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width
{
    if (top) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (left) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, width, view.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (bottom) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, view.frame.size.height - width, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (right) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(view.frame.size.width - width, 0, width, view.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
}

@end
