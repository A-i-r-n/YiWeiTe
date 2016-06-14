//
//  Store_OrderViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/6/12.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Store_OrderViewController.h"

#import "Store_AllViewController.h"
#import "Store_PayViewController.h"
#import "Store_ShipmentsViewController.h"
#import "Store_TViewController.h"



@interface Store_OrderViewController ()<DLTabedSlideViewDelegate>

@property (nonatomic,strong) DLTabedSlideView *tabedSlideView;
@end

@implementation Store_OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"订单管理";
    [self createNavigation];
    [self createSliderView];
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
    
    DLTabedbarItem *item1 = [DLTabedbarItem itemWithTitle:@"全部" image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];
    DLTabedbarItem *item2 = [DLTabedbarItem itemWithTitle:@"待付款(??)" image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];
    DLTabedbarItem *item3 = [DLTabedbarItem itemWithTitle:@"待发货(??)" image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];
    DLTabedbarItem *item4 = [DLTabedbarItem itemWithTitle:@"退款中(???)" image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];
    self.tabedSlideView.tabbarItems = @[item1, item2,item3,item4];
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
            Store_AllViewController *all = [[Store_AllViewController alloc]init];
            return all;
        }
        case 1:
        {
            Store_PayViewController *pay = [[Store_PayViewController alloc]init];
            return pay;
        }
        case 2:
        {
            Store_ShipmentsViewController *ship = [[Store_ShipmentsViewController alloc]init];
            return ship;
        }
        case 3:
        {
            Store_TViewController *tui = [[Store_TViewController alloc]init];
            return tui;
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
