//
//  MainViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/10.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "MainViewController.h"
#import "UIButton+LXMImagePosition.h"
#import "NavigationView.h"

#import "BtnTableViewCell.h"
#import "TwoBtnTableViewCell.h"
#import "ThreeBtnTableViewCell.h"
#import "FourBtnTableViewCell.h"
#import "Main_ListTableViewCell.h"

#import "CateViewController.h"
#import "HotelViewController.h"
#import "RelaxationViewController.h"
#import "BeautyViewController.h"
#import "BabyViewController.h"
#import "MarketViewController.h"
#import "ClothesViewController.h"
#import "YiYuanViewController.h"
#import "CartViewController.h"
#import "LifeSeviceViewController.h"

#import "Two_LeftViewController.h"
#import "Two_RightViewController.h"
#import "Three_LeftViewController.h"
#import "Three_RTViewController.h"
#import "Three_RBViewController.h"
#import "Four_LTViewController.h"
#import "Four_LBViewController.h"
#import "Four_RTViewController.h"
#import "Four_RBViewController.h"

#import "NearbyViewController.h"
#import "NationwideViewController.h"
#import "LikeViewController.h"
#import "TrackViewController.h"


@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate,DLTabedSlideViewDelegate>
{
    NSMutableArray *_itemArray;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self registTableView];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    //[self setupNavigationBar];
    self.title = @"主页";
    
    
}

- (void)registTableView
{
    _tableView.allowsSelection = NO;
    [_tableView registerClass:[BtnTableViewCell class] forCellReuseIdentifier:@"btnCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"TwoBtnTableViewCell" bundle:nil] forCellReuseIdentifier:@"twoBtnCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"ThreeBtnTableViewCell" bundle:nil] forCellReuseIdentifier:@"threeBtnCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"FourBtnTableViewCell" bundle:nil] forCellReuseIdentifier:@"fourBtnCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Main_ListTableViewCell" bundle:nil] forCellReuseIdentifier:@"listCell"];
    
}

- (void)setupNavigationBar
{
    
    NavigationView *navView = [[NavigationView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    [self.navigationController.view addSubview:navView];
    
}



#pragma mark  TableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 140;
    }
    if (section == 1) {
        return 40;
    }
    return 0.01;
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 120)];
        view.backgroundColor = [UIColor orangeColor];
         return view;
        
    }
    if (section == 1) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 30, 30)];
        //imgView.backgroundColor = [UIColor orangeColor];
        imgView.image = [UIImage imageNamed:@"首页_11"];
        [view addSubview:imgView];
        
        UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(50, 5, 80, 30)];
        titleLab.font = [UIFont systemFontOfSize:15];
        titleLab.text = @"夺宝通知:";
        [view addSubview:titleLab];
        
        UILabel *subTitleLab = [[UILabel alloc]initWithFrame:CGRectMake(130, 5, ScreenWidth - 150, 30)];
        subTitleLab.text = @"xxx成功夺得iPhone6s一部!";
        subTitleLab.font = [UIFont systemFontOfSize:12];
        [view addSubview:subTitleLab];
        return view;
    }
    return 0;
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }
    if (section == 1) {
        return 2;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 150 * ScreenWidth / 375.0;
        }
        if (indexPath.row == 1) {
            return 100 * ScreenWidth / 375.0;
        }

    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return 120 * ScreenWidth / 375.0;
        }
        if (indexPath.row == 1) {
            return 150 * ScreenWidth / 375.0;
        }
    }
    return 500 * ScreenWidth / 375.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            BtnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"btnCell" forIndexPath:indexPath];
            for (int i = 0; i<10; i++) {
                ImageCenterButton *button = (ImageCenterButton *)[cell viewWithTag:10 + i];
                [button addTarget:self action:@selector(categoryClick:) forControlEvents:UIControlEventTouchUpInside];
            }
            
            return cell;
        }
        if (indexPath.row == 1) {
            TwoBtnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"twoBtnCell" forIndexPath:indexPath];
            [cell.leftBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            return cell;
        }
        
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            ThreeBtnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"threeBtnCell" forIndexPath:indexPath];
            [cell.leftBtn addTarget:self action:@selector(threeLeftClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.rightTopBtn addTarget:self action:@selector(threeRightTopClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.rightBottomBtn addTarget:self action:@selector(threeRightBottomClick:) forControlEvents:UIControlEventTouchUpInside];
            return cell;
        }
        if (indexPath.row == 1) {
            FourBtnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fourBtnCell" forIndexPath:indexPath];
            [cell.leftTopBtn addTarget:self action:@selector(leftTopClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.leftBottomBtn addTarget:self action:@selector(leftBottomClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.rightTopBtn addTarget:self action:@selector(rightTopClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.rightBottomBtn addTarget:self action:@selector(rightBottomClick:) forControlEvents:UIControlEventTouchUpInside];
            return cell;
        }
        
    }
 
    

    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    self.tabedSlideView = [[DLTabedSlideView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 500)];
    self.tabedSlideView.delegate=self;
    self.tabedSlideView.baseViewController = self;
    self.tabedSlideView.tabItemNormalColor = [UIColor blackColor];
    self.tabedSlideView.tabItemSelectedColor = SELECT_TEXTCOLOR;
    self.tabedSlideView.tabbarTrackColor = SELECT_TEXTCOLOR;
    self.tabedSlideView.tabbarBackgroundImage = [UIImage imageNamed:@"tabbarBk"];
    self.tabedSlideView.tabbarBottomSpacing = 3.0;
    
    DLTabedbarItem *item1 = [DLTabedbarItem itemWithTitle:@"附近商家" image:[UIImage imageNamed:@"arrow_down"] selectedImage:[UIImage imageNamed:@"arrow_up"]];
    DLTabedbarItem *item2 = [DLTabedbarItem itemWithTitle:@"全国商家" image:[UIImage imageNamed:@"arrow_down"] selectedImage:[UIImage imageNamed:@"arrow_up"]];
    DLTabedbarItem *item3 = [DLTabedbarItem itemWithTitle:@"猜你喜欢" image:[UIImage imageNamed:@"arrow_down"] selectedImage:[UIImage imageNamed:@"arrow_up"]];
    DLTabedbarItem *item4 = [DLTabedbarItem itemWithTitle:@"足迹" image:[UIImage imageNamed:@"arrow_down"] selectedImage:[UIImage imageNamed:@"arrow_up"]];
    self.tabedSlideView.tabbarItems = @[item1, item2, item3,item4];
    [self.tabedSlideView buildTabbar];
    
    self.tabedSlideView.selectedIndex = 0;
    [cell.contentView addSubview:_tabedSlideView];
    return cell;
}


#pragma  mark  DLSlicdeView Delegate

- (NSInteger)numberOfTabsInDLTabedSlideView:(DLTabedSlideView *)sender{
    return self.tabedSlideView.tabbarItems.count;
}
- (UIViewController *)DLTabedSlideView:(DLTabedSlideView *)sender controllerAt:(NSInteger)index{
    switch (index) {
        case 0:
        {
            NearbyViewController *nearby = [[NearbyViewController alloc]init];
            return nearby;
        }
        case 1:
        {
            NationwideViewController *nationWide = [[NationwideViewController alloc]init];
            return nationWide;
        }
        case 2:
        {
            LikeViewController *like = [[LikeViewController alloc]init];
            return like;
        }
        case 3:
        {
            TrackViewController *track = [[TrackViewController alloc]init];
            return track;
        }
            
        default:
            return nil;
    }
}

//两按钮/左侧按钮
- (void)leftBtnClick:(UIButton *)button
{
    Two_LeftViewController *left = [[Two_LeftViewController alloc]init];
    [self.navigationController pushViewController:left animated:YES];
}

//两按钮/右侧按钮
- (void)rightBtnClick:(UIButton *)button
{
    Two_RightViewController *right = [[Two_RightViewController alloc]init];
    [self.navigationController pushViewController:right animated:YES];
}

//三按钮/左
- (void)threeLeftClick:(UIButton *)button
{
    Three_LeftViewController *left = [[Three_LeftViewController alloc]init];
    [self.navigationController pushViewController:left animated:YES];
}

//三按钮/右上
- (void)threeRightTopClick:(UIButton *)button
{
    Three_RTViewController *rt = [[Three_RTViewController alloc]init];
    [self.navigationController pushViewController:rt animated:YES];
}

//三按钮/右下
- (void)threeRightBottomClick:(UIButton *)button
{
    Three_RBViewController *rb = [[Three_RBViewController alloc]init];
    [self.navigationController pushViewController:rb animated:YES];
}

//四按钮/左上
- (void)leftTopClick:(UIButton *)button
{
    Four_LTViewController *lt = [[Four_LTViewController alloc]init];
    [self.navigationController pushViewController:lt animated:YES];
}

//四按钮/左下
- (void)leftBottomClick:(UIButton *)button
{
    Four_LBViewController *lb = [[Four_LBViewController alloc]init];
    [self.navigationController pushViewController:lb animated:YES];
}

//四按钮/右上
- (void)rightTopClick:(UIButton *)button
{
    Four_RTViewController *rt = [[Four_RTViewController alloc]init];
    [self.navigationController pushViewController:rt animated:YES];
}

//四按钮/右下
- (void)rightBottomClick:(UIButton *)button
{
    Four_RBViewController *rb = [[Four_RBViewController alloc]init];
    [self.navigationController pushViewController:rb animated:YES];
}

//十按钮
- (void)categoryClick:(ImageCenterButton *)button
{   UIViewController *controller ;
    switch (button.tag) {
        case 10:
        {
            controller = [[CateViewController alloc]init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
            
        case 11:
        {
            controller = [[HotelViewController alloc]init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;

        case 12:
        {
            controller = [[RelaxationViewController alloc]init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;

        case 13:
        {
            controller = [[BeautyViewController alloc]init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;

        case 14:
        {
            controller = [[BabyViewController alloc]init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;

        case 15:
        {
            controller = [[MarketViewController alloc]init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;

        case 16:
        {
            controller = [[ClothesViewController alloc]init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;

        case 17:
        {
            controller = [[YiYuanViewController alloc]init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;

        case 18:
        {
            controller = [[CartViewController alloc]init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;

        case 19:
        {
            controller = [[LifeSeviceViewController alloc]init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;

        default:
            break;
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
