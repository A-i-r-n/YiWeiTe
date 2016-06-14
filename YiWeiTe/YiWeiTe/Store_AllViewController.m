
//
//  Store_AllViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/6/13.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Store_AllViewController.h"
#import "Store_OrderTableViewCell.h"

@interface Store_AllViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation Store_AllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self registCell];
    
}

- (void)registCell
{
    [_tableView registerNib:[UINib nibWithNibName:@"Store_OrderTableViewCell" bundle:nil] forCellReuseIdentifier:@"orderCell"];
}

#pragma mark tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120*ScreenWidth/375.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Store_OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"orderCell"];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
