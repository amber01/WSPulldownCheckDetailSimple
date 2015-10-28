//
//  TwoTableViewController.m
//  CustomNavignonSimple
//
//  Created by shlity on 15/8/6.
//  Copyright (c) 2015年 shlity. All rights reserved.
//

#import "TwoTableViewController.h"

@interface TwoTableViewController ()

@end

@implementation TwoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identityCell = @"cell";
    UITableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:identityCell];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identityCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = @"two";
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
