//
//  Store_WarehouseViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/6/8.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Store_WarehouseViewController.h"

#import "Store_GoodsTableViewCell.h"

@interface Store_WarehouseViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation Store_WarehouseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self registCell];
}

- (void)registCell
{
    [_tableView registerNib:[UINib nibWithNibName:@"Store_GoodsTableViewCell" bundle:nil] forCellReuseIdentifier:@"goodsCell"];
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
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120*ScreenWidth/375.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Store_GoodsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"goodsCell"];
    return cell;
    
//    static NSString *cellID = @"cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    if (!cell) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//    }
//    return cell;
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
