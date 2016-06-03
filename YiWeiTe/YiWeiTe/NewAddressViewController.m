//
//  NewAddressViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/6/3.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "NewAddressViewController.h"
#import "RDVTabBarController.h"

#import "Address_TFTableViewCell.h"
#import "Address_LabTableViewCell.h"
#import "TextFiledTableViewCell.h"

@interface NewAddressViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *titleArray;

@end

@implementation NewAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    //隐藏tabBar
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
    self.title = @"添加新地址";
    [self createNavigation];
    [self registCell];
}

- (void)registCell
{
    [_tableView registerNib:[UINib nibWithNibName:@"Address_TFTableViewCell" bundle:nil] forCellReuseIdentifier:@"tfCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Address_LabTableViewCell" bundle:nil] forCellReuseIdentifier:@"labCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"TextFiledTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}

- (void)createNavigation
{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem = leftItem;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveClick)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

//保存
- (void)saveClick
{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 4) {
            return 120;
        }
    }
    return 44;
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
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            Address_TFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tfCell" forIndexPath:indexPath];
            cell.titleLab.text = @"收货人";
            return cell;
        }
        if (indexPath.row == 1) {
            Address_TFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tfCell" forIndexPath:indexPath];
            cell.titleLab.text = @"联系电话";
            return cell;
        }
        if (indexPath.row == 2) {
            Address_LabTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"labCell" forIndexPath:indexPath];
            cell.titleLab.text = @"所在地区";
            cell.addressLab.text = @"请选择";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }
        
        if (indexPath.row == 3) {
            Address_LabTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"labCell" forIndexPath:indexPath];
            cell.titleLab.text = @"街道";
            cell.addressLab.text = @"请选择";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }
        if (indexPath.row == 4) {
            TextFiledTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
            return cell;
        }


    }
    Address_LabTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"labCell" forIndexPath:indexPath];
    cell.titleLab.text = @"设为默认";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
