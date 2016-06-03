//
//  Cart_OrderViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/6/2.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Cart_OrderViewController.h"

#import "RDVTabBarController.h"

#import "Cart_AddressTableViewCell.h"
#import "Cart_GoodsTableViewCell.h"
#import "Two_LabTableViewCell.h"
#import "Cart_TFTableViewCell.h"
#import "Cart_PayTableViewCell.h"

#import "AddressViewController.h"

@interface Cart_OrderViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *titleArray;
@property(nonatomic,strong)NSMutableArray *typeArray;

@end

@implementation Cart_OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _titleArray = [NSMutableArray arrayWithObjects:@"支付方式",@"配送方式",@"发票信息", nil];
    
    _typeArray = [NSMutableArray arrayWithObjects:@"到店付款",@"商家配送",@"明细(纸质)-个人", nil];
    
    self.title = @"填写订单";
    //隐藏tabBar
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
    
    [self registCell];
    
}

- (void)registCell
{
    //_tableView.allowsSelection = NO;
    //_tableView.sectionIndexColor = [UIColor clearColor];
    [_tableView registerNib:[UINib nibWithNibName:@"Cart_AddressTableViewCell" bundle:nil] forCellReuseIdentifier:@"addCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Cart_GoodsTableViewCell" bundle:nil] forCellReuseIdentifier:@"goodsCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Two_LabTableViewCell" bundle:nil] forCellReuseIdentifier:@"labCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Cart_TFTableViewCell" bundle:nil] forCellReuseIdentifier:@"tfCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Cart_PayTableViewCell" bundle:nil] forCellReuseIdentifier:@"payCell"];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 1) {
        return 4;
    }
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 5) {
        return 40;
    }
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 80 * ScreenWidth / 375.0;
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
        return 130 * ScreenWidth / 375.0;
        }
    }
    if (indexPath.section == 5) {
        return 64 * ScreenWidth / 375.0;
    }
    return 44 * ScreenWidth / 375.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.01;
    }
    if (section == 1) {
        return 20;
    }
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            Cart_AddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addCell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone; 
            return cell;
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            Cart_GoodsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"goodsCell" forIndexPath:indexPath];
            return cell;
        }
        Two_LabTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"labCell" forIndexPath:indexPath];
        cell.titleLab.text = _titleArray[indexPath.row - 1];
        cell.typeLab.text = _typeArray[indexPath.row - 1];
        return cell;
    }
    if (indexPath.section == 2) {
        Two_LabTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"labCell" forIndexPath:indexPath];
        cell.titleLab.text = @"优惠券";
        cell.typeLab.text = @"无可用";
        return cell;
    }
    
    if (indexPath.section == 3) {
        Cart_TFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tfCell" forIndexPath:indexPath];
        cell.leftLab.text = @"必填";
        cell.rightTf.placeholder = @"到店提货时间";
        return cell;
    }
    
    if (indexPath.section == 4) {
        Cart_TFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tfCell" forIndexPath:indexPath];
        cell.leftLab.text = @"选填";
        cell.rightTf.placeholder = @"给店家留言(50字以内)";
        return cell;
    }
    
    
        Cart_PayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"payCell" forIndexPath:indexPath];
        return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            AddressViewController *address = [[AddressViewController alloc]init];
            [self.navigationController pushViewController:address animated:YES];
        }
    }
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
