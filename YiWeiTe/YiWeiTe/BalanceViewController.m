//
//  BalanceViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/23.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "BalanceViewController.h"

@interface BalanceViewController ()

@end

@implementation BalanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"账户余额";
    [self createNavigationView];
}

- (void)createNavigationView
{
    self.navigationController.view.backgroundColor = [UIColor orangeColor];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(leftItemClick)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    //UIBarButtonItem *detailItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"third_selected"] style:UIBarButtonItemStylePlain target:self action:@selector(detailClick)];
    UIBarButtonItem *detailItem = [[UIBarButtonItem alloc]initWithTitle:@"余额明细" style:UIBarButtonItemStylePlain target:self action:@selector(detailClick)];
    detailItem.tintColor = SELECT_TEXTCOLOR;
    self.navigationItem.rightBarButtonItem = detailItem;
    
}

//返回
- (void)leftItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

//余额明细
- (void)detailClick
{
    
}

//充值
- (IBAction)rechargeClick:(id)sender
{
    
}

//提现
- (IBAction)cashClick:(id)sender
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
