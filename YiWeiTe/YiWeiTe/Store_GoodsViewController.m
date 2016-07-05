//
//  Store_GoodsViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/6/8.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Store_GoodsViewController.h"

#import "RDVTabBarController.h"

#import "Store_SalesViewController.h"
#import "Store_WarehouseViewController.h"

@interface Store_GoodsViewController ()<DLTabedSlideViewDelegate>

@property (nonatomic,strong) DLTabedSlideView *tabedSlideView;

@end

@implementation Store_GoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"宝贝管理";
    //隐藏tabBar
    //[[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
    [self createNavigation];
    [self createSliderView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //隐藏tabBar
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
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


- (void)createSliderView
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64 - 44)];
    //    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    self.tabedSlideView = [[DLTabedSlideView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 64 - 44)];
    self.tabedSlideView.delegate=self;
    self.tabedSlideView.baseViewController = self;
    self.tabedSlideView.tabItemNormalColor = [UIColor blackColor];
    self.tabedSlideView.tabItemSelectedColor = SELECT_TEXTCOLOR;
    self.tabedSlideView.tabbarTrackColor = SELECT_TEXTCOLOR;
    self.tabedSlideView.tabbarBackgroundImage = [UIImage imageNamed:@"tabbarBk"];
    self.tabedSlideView.tabbarBottomSpacing = 3.0;
    
    DLTabedbarItem *item1 = [DLTabedbarItem itemWithTitle:@"出售中(???)" image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];
    DLTabedbarItem *item2 = [DLTabedbarItem itemWithTitle:@"仓库中(???)" image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];
    self.tabedSlideView.tabbarItems = @[item1, item2];
    [self.tabedSlideView buildTabbar];
    
    self.tabedSlideView.selectedIndex = 0;
    [view addSubview:_tabedSlideView];
}
#pragma  mark  DLTableDelegate
- (NSInteger)numberOfTabsInDLTabedSlideView:(DLTabedSlideView *)sender{
    return self.tabedSlideView.tabbarItems.count;
}
- (UIViewController *)DLTabedSlideView:(DLTabedSlideView *)sender controllerAt:(NSInteger)index{
    switch (index) {
        case 0:
        {
            Store_SalesViewController *sales = [[Store_SalesViewController alloc]init];
            return sales;
        }
        case 1:
        {
            Store_WarehouseViewController *warehouse = [[Store_WarehouseViewController alloc]init];
            return warehouse;
        }
            
        default:
            return nil;
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
