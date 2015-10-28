//
//  ViewController.m
//  WSPulldownCheckDetailSimple
//
//  Created by shlity on 15/10/28.
//  Copyright (c) 2015年 shlity. All rights reserved.
//

#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define COLOR_BUTTON_NEW1 [UIColor colorWithRed:223/255.0f green:223/255.0f blue:223/255.0f alpha:1.0]
#define COLOR_CELL_NEW   [UIColor colorWithRed:242 / 255.0 green:242 / 255.0 blue:242 / 255.0 alpha:1.0]

#import "ViewController.h"
#import "UIViewExt.h"
#import "ScorellButtonView.h"
#import "GoodsLoadMoreFootView.h"
#import "GoodsLoadMoreTopView.h"
#import <QuartzCore/CATransform3D.h>

@interface ViewController ()<UIWebViewDelegate,UIScrollViewDelegate>
{
    UIView               *topView;
    ScorellButtonView    *scorllBtnView;
    BOOL                 isLoadMore;
    BOOL                 isLoadTopMore;
    GoodsLoadMoreTopView *loadMoreTopView1;
    GoodsLoadMoreTopView *loadMoreTopView2;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品详情";
    isLoadMore = NO;
    isLoadTopMore = YES;
    [self createScrollView];
    [self createdFootMoreView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)createScrollView
{
    self.myScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    self.myScrollView.backgroundColor = [UIColor whiteColor];
    self.myScrollView.delegate = self;
    [self.view addSubview:self.myScrollView];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.myScrollView addSubview:_tableView];
    
    GoodsLoadMoreFootView *goodsLoadMoreView = [[GoodsLoadMoreFootView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 49)];
    _tableView.tableFooterView = goodsLoadMoreView;
}

- (void)scrollViewByPageControlPage:(NSInteger)page
{
    [UIView animateWithDuration:0.2f animations:^{
        if (isLoadMore == NO) {
            [self.myScrollView setContentOffset:CGPointMake(0, (ScreenHeight-64)*page)];
        }else{
            [self.myScrollView setContentOffset:CGPointMake(0, ((ScreenHeight-64)*page) - 64)];
        }
        
    } completion:^(BOOL finished) {
        isLoadMore = YES;
    }];
}

- (void)createdFootMoreView
{
    scorllBtnView = [[ScorellButtonView alloc]initWithFrame:CGRectMake(0, _tableView.bottom, ScreenWidth, ScreenHeight)];
    scorllBtnView.oneVC.tableView.delegate = self;
    scorllBtnView.twoVC.tableView.delegate = self;
    
    loadMoreTopView1 = [[GoodsLoadMoreTopView alloc]initWithFrame:CGRectMake(0, -56, ScreenWidth, 56)];
    loadMoreTopView2 = [[GoodsLoadMoreTopView alloc]initWithFrame:CGRectMake(0, -56, ScreenWidth, 56)];
    [scorllBtnView.twoVC.tableView addSubview:loadMoreTopView2];
    [scorllBtnView.oneVC.tableView addSubview:loadMoreTopView1];
    
    
    [self.myScrollView addSubview:scorllBtnView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = @"cellname";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = @"test";
    
    return cell;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    float offset = scrollView.contentOffset.y;
    float contentHeight = scrollView.contentSize.height;
    float sub = contentHeight-offset;
    
    if (isLoadTopMore == YES) {
        if (scrollView.height - sub > 30) {
            isLoadTopMore = NO;
            isLoadMore = NO;
            [self scrollViewByPageControlPage:1];
        }
    }
    
    if (isLoadMore == YES && isLoadTopMore == NO) {
        if (offset < -64) {
            isLoadTopMore = YES;
            [self scrollViewByPageControlPage:0];
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    float offset = scrollView.contentOffset.y;
    if (isLoadMore == YES && isLoadTopMore == NO) {
        if (offset <= -64) {
            loadMoreTopView1.pullTextLabe.text = @"松开,返回商品详情";
            loadMoreTopView2.pullTextLabe.text = @"松开,返回商品详情";
            
            CGAffineTransform rotate = CGAffineTransformMakeRotation( 1.0 / 180.0 * 3.14 );
            [loadMoreTopView1.pulldownView setTransform:rotate];
            [loadMoreTopView2.pulldownView setTransform:rotate];
            
        }else{
            loadMoreTopView1.pulldownView.layer.transform = CATransform3DMakeRotation((M_PI * 180)/180,0,0,1);
            loadMoreTopView2.pulldownView.layer.transform = CATransform3DMakeRotation((M_PI * 180)/180,0,0,1);
            
            loadMoreTopView1.pullTextLabe.text = @"下拉,返回商品详情";
            loadMoreTopView2.pullTextLabe.text = @"下拉,返回商品详情";
        }
    }
}

- (void)createTableView
{
    
}

@end

