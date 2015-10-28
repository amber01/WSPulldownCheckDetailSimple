//
//  ViewController.h
//  WSPulldownCheckDetailSimple
//
//  Created by shlity on 15/10/28.
//  Copyright (c) 2015年 shlity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView   *_tableView;
}

@property (nonatomic,retain)UIScrollView  *myScrollView;

@end


