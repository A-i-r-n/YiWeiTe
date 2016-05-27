//
//  MyOrderViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/16.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "MyOrderViewController.h"
#import "DLSlideView/DLTabedSlideView.h"

#import "MyOrder_AllViewController.h"
#import "MyOrder_PayViewController.h"
#import "MyOrder_ShipmentViewController.h"
#import "MyOrder_ShouHuoViewController.h"
#import "MyOrder_EvaluateViewController.h"



@interface MyOrderViewController ()<DLTabedSlideViewDelegate>

@property (nonatomic,strong) DLTabedSlideView *tabedSlideView;

@end

@implementation MyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = NO;
    [self createNavigationView];
    [self createSliderView];
}

- (void)createNavigationView
{
    self.title = @"我的订单";
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(leftItemClick)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"second_selected"] style:UIBarButtonItemStyleDone target:self action:@selector(searchClick)];
    UIBarButtonItem *messageItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"third_selected"] style:UIBarButtonItemStylePlain target:self action:@selector(messageClick)];
    self.navigationItem.rightBarButtonItems = @[messageItem,searchItem];
   
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
    DLTabedbarItem *item2 = [DLTabedbarItem itemWithTitle:@"待付款" image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];
    DLTabedbarItem *item3 = [DLTabedbarItem itemWithTitle:@"待发货" image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];
    DLTabedbarItem *item4 = [DLTabedbarItem itemWithTitle:@"待收货" image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];
    DLTabedbarItem *item5 = [DLTabedbarItem itemWithTitle:@"待评价" image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];

    self.tabedSlideView.tabbarItems = @[item1, item2, item3,item4,item5];
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
            MyOrder_AllViewController *all = [[MyOrder_AllViewController alloc]init];
            return all;
        }
        case 1:
        {
            MyOrder_PayViewController *pay = [[MyOrder_PayViewController alloc]init];
            return pay;
        }
        case 2:
        {
            MyOrder_ShipmentViewController *shipment = [[MyOrder_ShipmentViewController alloc]init];
            return shipment;
            
        }
        case 3:
        {
            MyOrder_ShouHuoViewController *shouHuo = [[MyOrder_ShouHuoViewController alloc]init];
            return shouHuo;
            
        }
        case 4:
        {
            MyOrder_EvaluateViewController *evaluate = [[MyOrder_EvaluateViewController alloc]init];
            return evaluate;
        }
            
        default:
            return nil;
    }
}


- (void)leftItemClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//搜索
- (void)searchClick
{
    NSLog(@"搜索");
}

//消息
- (void)messageClick
{
    NSLog(@"消息");
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
