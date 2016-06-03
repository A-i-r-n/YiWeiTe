//
//  SubmitViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/6/3.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "SubmitViewController.h"
#import "Address_LabTableViewCell.h"

#import "DesignPayViewController.h"

@interface SubmitViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation SubmitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"填写订单";
    [self createNavigation];
    [self registCell];
}

- (void)registCell
{
    [_tableView registerNib:[UINib nibWithNibName:@"Address_LabTableViewCell" bundle:nil] forCellReuseIdentifier:@"labCell"];
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


#pragma mark tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        Address_LabTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"labCell"];
        cell.titleLab.text = @"付款方式";
        cell.addressLab.text = @"余额支付";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    
    Address_LabTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"labCell"];
    cell.titleLab.text = @"需付款";
    cell.addressLab.textColor = SELECT_TEXTCOLOR;
    cell.addressLab.text = @"79888.00元";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}

//确认付款
- (IBAction)payClick:(id)sender
{
    DesignPayViewController *design = [[DesignPayViewController alloc]init];
    [self.navigationController pushViewController:design animated:YES];
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
