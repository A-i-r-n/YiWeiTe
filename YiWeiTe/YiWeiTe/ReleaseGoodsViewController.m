//
//  ReleaseGoodsViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/6/8.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "ReleaseGoodsViewController.h"

@interface ReleaseGoodsViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ReleaseGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//返回
- (IBAction)backClick:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//放入仓库
- (IBAction)pullClick:(id)sender
{
    NSLog(@"放入仓库");
}

//立即发布
- (IBAction)releaseClick:(id)sender
{
     NSLog(@"立即发布");
}

#pragma mark tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0 || section == 1) {
        return 3;
    }
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
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 100*ScreenWidth/375.0;
        }
        if (indexPath.row == 1) {
            return 70*ScreenWidth/375.0;
        }
    }
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
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
