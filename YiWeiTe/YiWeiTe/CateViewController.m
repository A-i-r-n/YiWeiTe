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
#import "Main_ListTableViewCell.h"
#import "DetailViewController.h"

#import "HMSegmentedControl.h"

//#import "Main_ListTableViewCell.h"
//#import "DetailViewController.h"



@interface CateViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSInteger _SelectedIndex;
}

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
    

    [_tableView registerNib:[UINib nibWithNibName:@"Main_ListTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
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
    if (section == 1) {
        return 1;
    }
    return 10;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        return 50;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return Ratio(140);
        }
        if (indexPath.row == 1) {
            return Ratio(185);
        }
       
    }
    if (indexPath.section == 1) {
        return Ratio(150);//150 * ScreenWidth / 375.0;;
    }
    return Ratio(80);//500 * ScreenWidth / 375.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 2) {

        HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"附近商家", @"全国商家", @"猜你喜欢",@"我的足迹"]];
        segmentedControl.frame = CGRectMake(0, 10, ScreenWidth, 40);
        segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
        segmentedControl.selectedSegmentIndex = _SelectedIndex;
        segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
        segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : SELECT_TEXTCOLOR};
        segmentedControl.selectionIndicatorColor = SELECT_TEXTCOLOR;
        //segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleBox;
        
        [segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
        return segmentedControl;
    }
    return nil;
}

//分类
- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"选中%ld", (long)segmentedControl.selectedSegmentIndex);
    _SelectedIndex = segmentedControl.selectedSegmentIndex;
    
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
    

    Main_ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
   
   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2) {
        DetailViewController *detail = [[DetailViewController alloc]init];
        [self.navigationController pushViewController:detail animated:YES];

    }
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
