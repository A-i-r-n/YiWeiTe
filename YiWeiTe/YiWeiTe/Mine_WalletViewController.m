//
//  Mine_WalletViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/17.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Mine_WalletViewController.h"
#import "MineCollectionViewCell.h"

#import "BankcardViewController.h"
#import "BalanceViewController.h"

@interface Mine_WalletViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation Mine_WalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.title = @"我的钱包";
    self.navigationController.navigationBarHidden = YES;
    [_collectionView registerNib:[UINib nibWithNibName:@"MineCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((ScreenWidth - 3) / 3.0, (ScreenWidth - 3) / 3.0);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MineCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

//返回
- (IBAction)backBtn:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//账户余额
- (IBAction)balanceClick:(id)sender
{
    BalanceViewController *balance = [[BalanceViewController alloc]init];
    [self.navigationController pushViewController:balance animated:YES];
}

//银行卡
- (IBAction)bankCardClick:(id)sender
{
    BankcardViewController *bankCard = [[BankcardViewController alloc]init];
    [self.navigationController pushViewController:bankCard animated:YES];
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
