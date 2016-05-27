//
//  Mine_IntegralViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/17.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Mine_IntegralViewController.h"

#import "Integral_ScrollTableViewCell.h"
#import "Integral_ThreeBtnTableViewCell.h"
#import "Integral_NotificateTableViewCell.h"
#import "Integral_ChoujiangTableViewCell.h"

#import "ChoujiangCollectionViewCell.h"


@interface Mine_IntegralViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation Mine_IntegralViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = NO;
    
    [self createNavigationView];
    [self registCell];
}

- (void)createNavigationView
{
    self.title = @"积分商城";
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(leftItemClick)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *messageItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"third_selected"] style:UIBarButtonItemStylePlain target:self action:@selector(messageClick)];

    self.navigationItem.rightBarButtonItem = messageItem;
}

- (void)registCell
{
    //[_tableView registerClass:[Integral_ScrollTableViewCell class] forCellReuseIdentifier:@"scrollCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Integral_ScrollTableViewCell" bundle:nil] forCellReuseIdentifier:@"scrollCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Integral_ThreeBtnTableViewCell" bundle:nil] forCellReuseIdentifier:@"threeCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Integral_NotificateTableViewCell" bundle:nil] forCellReuseIdentifier:@"notiCell"];
    //[_tableView registerClass:[Integral_ChoujiangTableViewCell class] forCellReuseIdentifier:@"chouCell"];
     [_tableView registerNib:[UINib nibWithNibName:@"Integral_ChoujiangTableViewCell" bundle:nil] forCellReuseIdentifier:@"chouCell"];
}

- (void)leftItemClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)messageClick
{
    
}



#pragma  mark tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        return 2;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 220 * ScreenWidth / 375.0;
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return 165 * ScreenWidth / 375.0;
        }
        if (indexPath.row == 1) {
            return 55 * ScreenWidth / 375.0;
        }
    }
    return 380 * ScreenWidth / 375.0;;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            Integral_ScrollTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"scrollCell" forIndexPath:indexPath];
            return cell;
        }
       
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            Integral_ThreeBtnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"threeCell" forIndexPath:indexPath];
            return cell;
        }
        if (indexPath.row == 1) {
            Integral_NotificateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"notiCell" forIndexPath:indexPath];
            return cell;
        }
    }
    Integral_ChoujiangTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chouCell" forIndexPath:indexPath];
    
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
