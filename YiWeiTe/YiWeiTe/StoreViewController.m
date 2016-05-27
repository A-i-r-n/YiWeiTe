//
//  StoreViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/10.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "StoreViewController.h"
#import "Main_ListTableViewCell.h"

#import "DSConfig.h"
#import "ViewFilterSingle.h"
#import "ViewFilterDouble.h"
#import "FilterViewTool.h"




@interface StoreViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) FilterViewTool *viewFilter;

@end

@implementation StoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.translucent = NO;
    [self.view setBackgroundColor:DSBackColor];

    [self initUI];

}

- (void)initUI {
    [self setTitle:@""];
    [self.view addSubview:self.viewFilter];
}

- (FilterViewTool *)viewFilter {
    if (_viewFilter == nil) {
        _viewFilter = [[FilterViewTool alloc] init];
        //        _viewFilter.backgroundColor = DSColor;
    }
    return _viewFilter;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.viewFilter.frame = CGRectMake(0, 0, SCREENWIDTH , 54);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [self createNavigation];
    
}

- (void)createNavigation
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 64)];
    UISegmentedControl *control = [[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"附近商家",@"全国商家",@"我要发布", nil]];
    control.bounds = CGRectMake(0, 0, 270 * ScreenWidth / 375.0, 34);
    control.center = CGPointMake(view.center.x, view.center.y +5);
    control.tintColor = SELECT_TEXTCOLOR;
    control.selectedSegmentIndex = 0;
    [control addTarget:self action:@selector(controlPressed:) forControlEvents:UIControlEventValueChanged];
    [view addSubview:control];
    [self.navigationController.view addSubview:view];
    
//    UIView *filtrateView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, 54)];
//    filtrateView.backgroundColor = [UIColor orangeColor];
//    [self.view addSubview:filtrateView];
    

    [_tableView registerNib:[UINib nibWithNibName:@"Main_ListTableViewCell" bundle:nil] forCellReuseIdentifier:@"listCell"];
    
    
    
//    CGFloat width = ScreenWidth;
//    CGFloat height = ScreenWidth * 142 / 414.0;
//    UIView *scrollView = [[UIView alloc]initWithFrame:CGRectMake(0,64 + 54, width, height)];
//    scrollView.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:scrollView];
    
    
}


#pragma mark segmentControl
- (void)controlPressed:(UISegmentedControl *)control
{
    if (control.selectedSegmentIndex == 0) {
      
         NSLog(@"1");
        
    }

    if (control.selectedSegmentIndex == 1) {
        NSLog(@"2");
        
        
        

    }
    if (control.selectedSegmentIndex == 2) {
        NSLog(@"3");

       
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.01;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 140 * ScreenWidth / 375.0;
    }
    return 80 * ScreenWidth / 375.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString *cellID = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        UIView *scrollView = [[UIView alloc]initWithFrame:CGRectMake(0,0, ScreenWidth, 140 * ScreenWidth / 375.0)];
        scrollView.backgroundColor = [UIColor redColor];
        [cell addSubview:scrollView];
        return cell;
    }
    
    Main_ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCell" forIndexPath:indexPath];
    return cell;
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
