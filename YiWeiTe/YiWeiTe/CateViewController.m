//
//  CateViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/24.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "CateViewController.h"
#import "MyButton.h"
#import "MessageButton.h"

#import "Cate_ScrollTableViewCell.h"
#import "Cate_BtnTableViewCell.h"
#import "Cate_TwoBtnTableViewCell.h"
#import "Cate_SliderTableViewCell.h"





@interface CateViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation CateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // self.navigationController.navigationBarHidden = YES;
    
    [self createNavigation];
    [self registCell];
    
}

- (void)registCell
{
    
    //[_tableView registerNib:[UINib nibWithNibName:@"Cate_ScrollTableViewCell" bundle:nil] forCellReuseIdentifier:@"scrollCell"];
    [_tableView registerClass:[Cate_ScrollTableViewCell class] forCellReuseIdentifier:@"scrollCell"];
    [_tableView registerClass:[Cate_BtnTableViewCell class] forCellReuseIdentifier:@"btnCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Cate_TwoBtnTableViewCell" bundle:nil] forCellReuseIdentifier:@"twoCell"];
    [_tableView registerClass:[Cate_SliderTableViewCell class] forCellReuseIdentifier:@"sliderCell"];
}

- (void)createNavigation
{
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 0, 32, 20)];
    [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    MyButton *button = [[MyButton alloc]initWithFrame:CGRectMake(44, 10, 45, 44)];
    [button addTarget:self action:@selector(addressClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItems = @[backItem,addItem];
    MessageButton *messBtn = [[MessageButton alloc]initWithFrame:CGRectMake(ScreenWidth - 15 - 40, 0, 30,30)];
    [messBtn addTarget:self action:@selector(messageClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:messBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(15 + 30 + 10 + 45 + 10, 20, ScreenWidth - 15 - 30 - 10 - 45 - 10 * 2 - 30 -15, 44)];
    searchBar.searchBarStyle = UISearchBarStyleMinimal;
    searchBar.placeholder = @"搜索商品/店铺";
    self.navigationItem.titleView = searchBar;
    //self.navigationController.view = searchBar;
    //[self.navigationController.view addSubview:searchBar];
}

//地址
- (void)addressClick
{
    NSLog(@"地址");
}

//返回
- (void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

//消息
- (void)messageClick
{
    NSLog(@"消息");
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
             return 140 * ScreenWidth / 375.0;
        }
        if (indexPath.row == 1) {
             return 185 * ScreenWidth / 375.0;
        }
       
    }
    if (indexPath.section == 1) {
        return 150 * ScreenWidth / 375.0;;
    }
     return 500 * ScreenWidth / 375.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            Cate_ScrollTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"scrollCell"];
            
            return cell;
        }
        if (indexPath.row == 1) {
            Cate_BtnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"btnCell"];
            return cell;
        }
    }
    if (indexPath.section == 1) {
        Cate_TwoBtnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"twoCell"];
        return cell;
    }
    
        Cate_SliderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sliderCell"];
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
