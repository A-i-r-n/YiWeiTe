//
//  DesignPayViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/6/3.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "DesignPayViewController.h"
#import "PayedTableViewCell.h"
#import "ZongJiaTableViewCell.h"

@interface DesignPayViewController ()<UITableViewDelegate,UITableViewDataSource>



@end

@implementation DesignPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"支付成功";
    [self createNavigation];
    [self registCell];
}

- (void)registCell
{
    [_tableView registerNib:[UINib nibWithNibName:@"PayedTableViewCell" bundle:nil] forCellReuseIdentifier:@"payCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"ZongJiaTableViewCell" bundle:nil] forCellReuseIdentifier:@"zongCell"];
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
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 80 * ScreenWidth / 375.0;
    }
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        PayedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"payCell"];
        return cell;
    }
    if (indexPath.row == 2) {
        ZongJiaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zongCell"];
        return cell;
    }
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text = @"收货人:周杰伦";
    cell.detailTextLabel.text = @"浙江省宁波市鄞州区首南街道南部商务区";
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
