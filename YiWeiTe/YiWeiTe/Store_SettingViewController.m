//
//  Store_SettingViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/6/12.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Store_SettingViewController.h"

#import "Address_TFTableViewCell.h"
#import "Mine_HeaderTableViewCell.h"

@interface Store_SettingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSMutableArray *titleArray;
@property(nonatomic,strong)NSMutableArray *placeHold;

@end

@implementation Store_SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _titleArray = [[NSMutableArray alloc]initWithObjects:@"店铺名称",@"店铺介绍",@"发货地址",@"退货地址", nil];
    _placeHold = [[NSMutableArray alloc]initWithObjects:@"请输入店铺名称",@"请输入店铺介绍",@"请输入发货地址",@"请输入退货地址", nil];
    self.title = @"店铺设置";
    [self createNavigation];
    [self registCell];
}

- (void)registCell
{
    [_tableView registerNib:[UINib nibWithNibName:@"Address_TFTableViewCell" bundle:nil] forCellReuseIdentifier:@"tfCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Mine_HeaderTableViewCell" bundle:nil] forCellReuseIdentifier:@"headerCell"];
}

//- (NSMutableArray *)titleArray
//{
//    if (!_titleArray) {
//        _titleArray = [[NSMutableArray alloc]initWithObjects:@"店铺名称",@"店铺介绍",@"发货地址",@"退货地址", nil];
//    }
//    return _titleArray;
//}
//
//- (NSMutableArray *)placeHold
//{
//    if (!_placeHold) {
//        _placeHold = [[NSMutableArray alloc]initWithObjects:@"请输入店铺名称",@"请输入店铺介绍",@"请输入发货地址",@"请输入退货地址", nil];
//    }
//    return _placeHold;
//}

- (void)createNavigation
{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}

//返回
- (void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 5;
    }
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
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 75;
        }
    }
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            Mine_HeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"headerCell"];
            [cell.headerBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
            cell.titleLab.text = @"店铺头像";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
            
        }
        Address_TFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tfCell"];
        cell.titleLab.text = _titleArray[indexPath.row - 1];
        cell.TextFile.placeholder = _placeHold[indexPath.row - 1];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.TextFile.textAlignment = NSTextAlignmentRight;
        return cell;
      
    }
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = @"消息设置";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

//切换头像
- (void)btnClick
{
    
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
