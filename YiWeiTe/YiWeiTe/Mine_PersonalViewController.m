
//
//  Mine_PersonalViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/31.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Mine_PersonalViewController.h"

@interface Mine_PersonalViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray *titleArray;

@end

@implementation Mine_PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"个人资料";
    _titleArray = [NSMutableArray arrayWithObjects:@"我的头像",@"会员名",@"我的昵称",@"性别",@"我的二维码名片",@"我的收货地址", nil];
    
}

//- (NSMutableArray *)titleArray
//{
//    if (!_titleArray) {
//        _titleArray = [NSMutableArray arrayWithObjects:@"我的头像",@"会员名",@"我的昵称",@"性别",@"我的二维码名片",@"我的收货地址", nil];
//    }
//    return _titleArray;
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = _titleArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 100 * ScreenWidth / 375.0;
    }
    return 75 * ScreenWidth / 375.0;
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
