//
//  BankcardViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/23.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "BankcardViewController.h"
#import "AddCardViewController.h"
#import "Bankcard_DetailViewController.h"

@interface BankcardViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation BankcardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"我的银行卡";
    [self createNavigation];
}

- (void)createNavigation
{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnClick)];
    self.navigationItem.leftBarButtonItem = leftItem;
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }

    if (indexPath.section == 0) {
        cell.imageView.image = [UIImage imageNamed:@"1"];
        cell.textLabel.text = @"中国建设银行";
        cell.detailTextLabel.text = @"尾号 1122";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    cell.imageView.image = [UIImage imageNamed:@"first_normal"];
    cell.textLabel.text = @"添加银行卡";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 40;
    }
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20,5, ScreenWidth, 30)];
        lab.text = @"储蓄卡";
        lab.font = [UIFont systemFontOfSize:16];
        [view addSubview:lab];
        return view;
    }
    return nil;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        Bankcard_DetailViewController *detail = [[Bankcard_DetailViewController alloc]init];
        [self.navigationController pushViewController:detail animated:YES];
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            AddCardViewController *addCard = [[AddCardViewController alloc]init];
            [self.navigationController pushViewController:addCard animated:YES];
        }
    }
}

- (void)leftBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
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
