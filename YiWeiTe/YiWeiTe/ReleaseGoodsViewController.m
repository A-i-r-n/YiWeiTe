//
//  ReleaseGoodsViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/6/8.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "ReleaseGoodsViewController.h"

#import "Address_TFTableViewCell.h"
#import "Store_ImgTableViewCell.h"
#import "TextFiledTableViewCell.h"
#import "Store_ImgBtnTableViewCell.h"


@interface ReleaseGoodsViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ReleaseGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self registCell];
}

- (void)registCell
{
    [_tableView registerNib:[UINib nibWithNibName:@"Address_TFTableViewCell" bundle:nil] forCellReuseIdentifier:@"aTFCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Store_ImgTableViewCell" bundle:nil] forCellReuseIdentifier:@"imgCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"TextFiledTableViewCell" bundle:nil] forCellReuseIdentifier:@"tfCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Store_ImgBtnTableViewCell" bundle:nil] forCellReuseIdentifier:@"btnCell"];
   
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
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            Store_ImgBtnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"btnCell"];
            [cell.imgBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        if (indexPath.row == 1) {
            TextFiledTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tfCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.Tf.placeholder = @"输入商品标题(少于50字)";
            cell.Tf.textAlignment = NSTextAlignmentRight;

            return cell;
        }
        if (indexPath.row == 2) {
            Address_TFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"aTFCell"];
            cell.titleLab.text = @"类目";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.TextFile.textAlignment = NSTextAlignmentRight;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }
       
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            Store_ImgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imgCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.Tf.textAlignment = NSTextAlignmentRight;
            cell.titleLab.text = @"价格";
            return cell;
        }
        if (indexPath.row == 2) {
            Store_ImgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imgCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.Tf.textAlignment = NSTextAlignmentRight;
            cell.titleLab.text = @"运费";
            return cell;
        }
        
        Address_TFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"aTFCell"];
        cell.titleLab.text = @"库存";
        cell.TextFile.textAlignment = NSTextAlignmentRight;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    if (indexPath.section == 2) {
        Address_TFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"aTFCell"];
        cell.titleLab.text = @"宝贝描述";
        cell.TextFile.textAlignment = NSTextAlignmentRight;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    Address_TFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"aTFCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.titleLab.text = @"发货地";
    cell.TextFile.textAlignment = NSTextAlignmentRight;
    return cell;
    
    
}


//添加照片
- (void)btnClick
{
    NSLog(@"进入相册");
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
