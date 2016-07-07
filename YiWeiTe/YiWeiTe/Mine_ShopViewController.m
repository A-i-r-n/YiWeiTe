//
//  Mine_ShopViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/17.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Mine_ShopViewController.h"

#import "Shop_DefaultViewController.h"
#import "Shop_SalesViewController.h"
#import "Shop_TicketViewController.h"
#import "Shop_ScreenViewController.h"



@interface Mine_ShopViewController ()<DLTabedSlideViewDelegate>


@property (nonatomic,strong) DLTabedSlideView *tabedSlideView;

@end

@implementation Mine_ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = NO;
    [self createSliderView];
    [self createNavigationView];
}

- (void)createNavigationView
{
    self.title = @"店铺";
    self.navigationController.view.backgroundColor = [UIColor orangeColor];
    
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
    
    DLTabedbarItem *item1 = [DLTabedbarItem itemWithTitle:@"默认" image:[UIImage imageNamed:@" "] selectedImage:[UIImage imageNamed:@" "]];
    DLTabedbarItem *item2 = [DLTabedbarItem itemWithTitle:@"促销优先" image:[UIImage imageNamed:@" "] selectedImage:[UIImage imageNamed:@" "]];
    DLTabedbarItem *item3 = [DLTabedbarItem itemWithTitle:@"有券优先" image:[UIImage imageNamed:@" "] selectedImage:[UIImage imageNamed:@" "]];
    DLTabedbarItem *item4 = [DLTabedbarItem itemWithTitle:@"筛选" image:[UIImage imageNamed:@" "] selectedImage:[UIImage imageNamed:@" "]];
    
    
    self.tabedSlideView.tabbarItems = @[item1, item2, item3,item4];
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
            Shop_DefaultViewController *shop_Default = [[Shop_DefaultViewController alloc]init];
            return shop_Default;
        }
        case 1:
        {
            Shop_SalesViewController *sales = [[Shop_SalesViewController alloc]init];
            return sales;
        }
        case 2:
        {
            
            Shop_TicketViewController *ticket = [[Shop_TicketViewController alloc]init];
            return ticket;
            
        }
        case 3:
        {
            
            Shop_ScreenViewController *screen = [[Shop_ScreenViewController alloc]init];
            return screen;
            
        }
            
            
        default:
            return nil;
    }
}



- (void)leftItemClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)searchClick
{
    
}

- (void)messageClick
{
    
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
