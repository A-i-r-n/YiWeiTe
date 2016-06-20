//
//  MineViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/10.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "MineViewController.h"

#import "Mine_MineTableViewCell.h"
#import "MineTableViewCell.h"
#import "Mine_OrderTableViewCell.h"
#import "Mine_LikeTableViewCell.h"
#import "Mine_StoreTableViewCell.h"
#import "Mine_BrandTableViewCell.h"

#import "MyOrderViewController.h"

#import "ImageCenterButton+MyImageCenterButton.h"

#import "MyOrder_PayViewController.h"
#import "MyOrder_ShouHuoViewController.h"
#import "MyOrder_EvaluateViewController.h"
#import "MyOrder_RefundViewController.h"

#import "Mine_TreasureViewController.h"
#import "Mine_ShopViewController.h"
#import "Mine_WalletViewController.h"
#import "Mine_FootprintViewController.h"

#import "Mine_IntegralViewController.h"
#import "Mine_ShareViewController.h"
#import "Mine_VipViewController.h"
#import "Mine_OpenshopViewController.h"

#import "Mine_JoinViewController.h"

#import "Mine_PersonalViewController.h"

//测试我的店铺
#import "MyStoreViewController.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_dataArray;
    NSMutableArray *_imgArray;
}
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = NO;
    self.title = @"我的";
    [self registCell];
    
}

- (void)registCell
{
    _tableView.showsVerticalScrollIndicator = NO;
    [_tableView registerNib:[UINib nibWithNibName:@"Mine_MineTableViewCell" bundle:nil] forCellReuseIdentifier:@"mine_mineCell"];
    [_tableView registerClass:[MineTableViewCell class] forCellReuseIdentifier:@"mineCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Mine_OrderTableViewCell" bundle:nil] forCellReuseIdentifier:@"orderCell"];
    [_tableView registerClass:[Mine_LikeTableViewCell class] forCellReuseIdentifier:@"likeCell"];
    [_tableView registerClass:[Mine_StoreTableViewCell class] forCellReuseIdentifier:@"storeCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Mine_BrandTableViewCell" bundle:nil] forCellReuseIdentifier:@"brandCell"];
   
}

#pragma mark tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }
    if (section == 1) {
        return 2;
    }
    return 1;
}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 10;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            Mine_MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mine_mineCell"];
            [cell.logoBtn addTarget:self action:@selector(personClick:) forControlEvents:UIControlEventTouchUpInside];
            
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
            
        }
        if (indexPath.row == 1) {
            Mine_OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"orderCell" forIndexPath:indexPath];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        if (indexPath.row == 2) {
            MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mineCell"];
            for (int i = 0; i<4; i++) {
                ImageCenterButton *button = (ImageCenterButton *)[cell viewWithTag:10 + i];
                [button addTarget:self action:@selector(mineClick:) forControlEvents:UIControlEventTouchUpInside];
            }
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
       
        
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            Mine_LikeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"likeCell" forIndexPath:indexPath];
            for (int i = 0; i<4; i++) {
                ImageCenterButton *button = (ImageCenterButton *)[cell viewWithTag:10 + i];
                [button addTarget:self action:@selector(mine_LikeClick:) forControlEvents:UIControlEventTouchUpInside];
            }
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        if (indexPath.row == 1) {
            Mine_StoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"storeCell" forIndexPath:indexPath];
            for (int i = 0; i<4; i++) {
                ImageCenterButton *button = (ImageCenterButton *)[cell viewWithTag:10 + i];
                [button addTarget:self action:@selector(mine_StoreClick:) forControlEvents:UIControlEventTouchUpInside];
            }

            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }
    
    if (indexPath.section ==2) {
        Mine_BrandTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"brandCell" forIndexPath:indexPath];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = @"text";
    return cell;
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 180 * ScreenWidth / 375.0;
        }
        if (indexPath.row == 1) {
            return 64 * ScreenWidth / 375.0;
        }
        return 80 * ScreenWidth / 375.0;
    }
    if (indexPath.section == 1) {
        return 80 * ScreenWidth / 375.0;
    }
    return 64 * ScreenWidth / 375.0;;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            MyOrderViewController *OrderVC = [[MyOrderViewController alloc]init];
            [self.navigationController pushViewController:OrderVC animated:YES];
        }
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            Mine_JoinViewController *join = [[Mine_JoinViewController alloc]init];
            [self.navigationController pushViewController:join animated:YES];
        }
    }
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            MyStoreViewController *store = [[MyStoreViewController alloc]init];
            [self.navigationController pushViewController:store animated:YES];

        }
    }

}

//代付款/待收货/待评价/退款
- (void)mineClick:(ImageCenterButton *)button
{
    UIViewController *viewController;
    if (button.tag == 10) {
        
        viewController = [[MyOrder_PayViewController alloc]init];
        [self.navigationController pushViewController:viewController animated:YES];
    }
    if (button.tag == 11) {
        
        viewController = [[MyOrder_ShouHuoViewController alloc]init];
        [self.navigationController pushViewController:viewController animated:YES];
        
    }
    if (button.tag == 12) {
        
        viewController = [[MyOrder_EvaluateViewController alloc]init];
        [self.navigationController pushViewController:viewController animated:YES];
        
    }
    if (button.tag == 13) {
        
        viewController = [[MyOrder_RefundViewController alloc]init];
        [self.navigationController pushViewController:viewController animated:YES];
        
    }

}

//宝贝收藏/店铺收藏/我的钱包/足迹
- (void)mine_LikeClick:(ImageCenterButton *)button
{
    if (button.tag == 10) {
        
        Mine_TreasureViewController *treasure = [[Mine_TreasureViewController alloc]init];
        [self.navigationController pushViewController:treasure animated:YES];
        
    }
    if (button.tag == 11) {
        
        Mine_ShopViewController *shop = [[Mine_ShopViewController alloc]init];
        [self.navigationController pushViewController:shop animated:YES];
 
    }
    if (button.tag == 12) {
        
        Mine_WalletViewController *wallet = [[Mine_WalletViewController alloc]init];
        [self.navigationController pushViewController:wallet animated:YES];

    }
    if (button.tag == 13) {
        
        Mine_FootprintViewController *footprint = [[Mine_FootprintViewController alloc]init];
        [self.navigationController pushViewController:footprint animated:YES];

    }
}

//积分商城/我的分享/会员中心/我要开店
- (void)mine_StoreClick:(ImageCenterButton *)button
{
    UIViewController *viewController;
    if (button.tag == 10) {
       
        viewController = [[Mine_IntegralViewController alloc]init];
        [self.navigationController pushViewController:viewController animated:YES];
    }
    if (button.tag == 11) {
       
        viewController = [[Mine_ShareViewController alloc]init];
        [self.navigationController pushViewController:viewController animated:YES];
        
    }
    if (button.tag == 12) {
        
        viewController = [[Mine_VipViewController alloc]init];
        [self.navigationController pushViewController:viewController animated:YES];
        
    }
    if (button.tag == 13) {
        
        viewController = [[Mine_OpenshopViewController alloc]init];
        [self.navigationController pushViewController:viewController animated:YES];
        
    }
}

//个人中心
- (void)personClick:(UIButton *)button
{
    Mine_PersonalViewController *personal = [[Mine_PersonalViewController alloc]init];
    [self.navigationController pushViewController:personal animated:YES];
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
