
//
//  Mine_PersonalViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/31.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Mine_PersonalViewController.h"
#import "Mine_HeaderTableViewCell.h"
#import "Two_LabTableViewCell.h"
#import "Address_TFTableViewCell.h"

#import "STPickerSingle.h"
#import "AddrListViewController.h"

@interface Mine_PersonalViewController ()<UITableViewDataSource,UITableViewDelegate,STPickerSingleDelegate>
@property(nonatomic,strong)NSMutableArray *titleArray;
@property(nonatomic,strong)NSMutableArray *arrayData;
@end

@implementation Mine_PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"个人资料";
    [self createNavigation];
    [self registCell];
    _titleArray = [NSMutableArray arrayWithObjects:@"性别",@"我的二维码名片",@"我的收货地址", nil];
    _arrayData = [NSMutableArray arrayWithObjects:@"男",@"女", nil];
}

- (void)registCell
{
    [_tableView registerNib:[UINib nibWithNibName:@"Mine_HeaderTableViewCell" bundle:nil] forCellReuseIdentifier:@"headCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Two_LabTableViewCell" bundle:nil] forCellReuseIdentifier:@"labCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Address_TFTableViewCell" bundle:nil] forCellReuseIdentifier:@"tfCell"];
}

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

//- (NSMutableArray *)titleArray
//{
//    if (!_titleArray) {
//        _titleArray = [NSMutableArray arrayWithObjects:@"我的头像",@"会员名",@"我的昵称",@"性别",@"我的二维码名片",@"我的收货地址", nil];
//    }
//    return _titleArray;
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        Mine_HeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"headCell"];
        cell.titleLab.text = @"我的头像";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    if (indexPath.row == 1) {
        Two_LabTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"labCell"];
        cell.titleLab.text = @"会员名";
        cell.typeLab.text = @"Air";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    if (indexPath.row == 2) {
        Address_TFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tfCell"];
        cell.titleLab.text = @"我的昵称";
        cell.TextFile.text = @"Air";
        cell.TextFile.textAlignment = NSTextAlignmentRight;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.row == 3){
        Two_LabTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"labCell"];
        cell.titleLab.text = @"性别";
        cell.typeLab.text = @"";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = _titleArray[indexPath.row - 3];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return Ratio(100);
    }
    return  Ratio(55);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 3) {
        STPickerSingle *pickerSingle = [[STPickerSingle alloc]init];
        pickerSingle.selectIndexPath = indexPath;
        [pickerSingle setArrayData:_arrayData];
        //[pickerSingle setTitle:@""];
        //[pickerSingle setTitleUnit:@""];
        [pickerSingle setContentMode:STPickerContentModeBottom];
        [pickerSingle setDelegate:self];
        [pickerSingle show];
    }
    
    if (indexPath.row == 5) {
        AddrListViewController *addrList = [[AddrListViewController alloc]init];
        [self.navigationController pushViewController:addrList animated:YES];
    }
    

}

#pragma mark STPickerSingleDelegate
- (void)pickerSingle:(STPickerSingle *)pickerSingle selectedTitle:(NSString *)selectedTitle
{
    NSString *text = [NSString stringWithFormat:@"%@", selectedTitle];
    Two_LabTableViewCell *cell = [self.tableView cellForRowAtIndexPath:pickerSingle.selectIndexPath];
    cell.typeLab.text = text;
    
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
