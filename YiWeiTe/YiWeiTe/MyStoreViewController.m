
//
//  MyStoreViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/6/6.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "MyStoreViewController.h"

#import "MyStoreTableViewCell.h"
#import "Store_BtnTableViewCell.h"
#import "Store_TableViewCell.h"


#import "MyCostumButton.h"
#import "RDVTabBarController.h"


#import "ReleaseGoodsViewController.h"
#import "Store_GoodsViewController.h"

@interface MyStoreViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MyStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"我的店铺";

    //隐藏tabBar
//    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    [self createNavigation];
    [self registCell];
}

- (void)registCell
{
    [_tableView registerNib:[UINib nibWithNibName:@"MyStoreTableViewCell" bundle:nil] forCellReuseIdentifier:@"sCell"];
    [_tableView registerClass:[Store_BtnTableViewCell class] forCellReuseIdentifier:@"btnCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Store_TableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}

- (void)createNavigation
{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem = leftItem;
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"fifth_normal"] style:UIBarButtonItemStyleDone target:self action:@selector(shareClidk)];
    UIBarButtonItem *messageItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"third_normal"] style:UIBarButtonItemStyleDone target:self action:@selector(messageClick)];
    self.navigationItem.rightBarButtonItems = @[messageItem,shareItem];
    
}

//返回
- (void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

//分享
- (void)shareClidk
{
    
}

//消息
- (void)messageClick
{
    
}

#pragma mark tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
   
        return 0.01;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 180 * ScreenWidth / 375.0;
    }
    return 240 * ScreenWidth / 375.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 0) {
        Store_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
   
    Store_BtnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"btnCell"];
    for (int i = 0; i<6; i++) {
        MyCostumButton *button = (MyCostumButton *)[cell viewWithTag:10+i];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)buttonClick:(MyCostumButton *)button
{
    switch (button.tag) {
        case 10:
        {
            NSLog(@"发布宝贝");
            ReleaseGoodsViewController *release = [[ReleaseGoodsViewController alloc]init];
            [self presentViewController:release animated:YES completion:nil];   
        }
            break;
        case 11:
        {
            NSLog(@"管理");
            Store_GoodsViewController *goods = [[Store_GoodsViewController alloc]init];
            [self.navigationController pushViewController:goods animated:YES];
        }
            break;
        case 12:
        {
            NSLog(@"订单");
        }
            break;
        case 13:
        {
            NSLog(@"代理");
        }
            break;
        case 14:
        {
            NSLog(@"装修");
        }
            break;
        case 15:
        {
            NSLog(@"设置");
        }
            break;
        default:
            break;
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
