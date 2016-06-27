//
//  MainViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/10.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "MainViewController.h"
#import "UIButton+LXMImagePosition.h"
#import "SDCycleScrollView.h"

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

#import "NewNoticeView.h"

#import "MJRefresh.h"

#import "Main_ListTableViewCell.h"
#import "DetailViewController.h"

#import "HMSegmentedControl.h"
#import "SearchBarView.h"

#import "MyButton.h"
#import "MessageButton.h"


@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate,DLTabedSlideViewDelegate,SearchBarViewDelegate,SDCycleScrollViewDelegate>
{
    
    NSMutableArray *_itemArray;
    NSMutableArray *_imgArray;
}

@property(nonatomic,assign)NSInteger SelectedIndex;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _imgArray = [NSMutableArray arrayWithObjects:@"banner1",@"banner2",@"banner3", nil];
    [self registTableView];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [self setupNavigationBar];
    //self.title = @"主页";
    
    
}

- (void)registTableView
{
    // 下拉刷新
    _tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [_tableView.mj_header endRefreshing];
        });
    }];
    
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    _tableView.mj_header.automaticallyChangeAlpha = YES;
    
    // 上拉刷新
    _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [_tableView.mj_footer endRefreshing];
        });
    }];

    _tableView.showsVerticalScrollIndicator = NO;
    [_tableView registerClass:[BtnTableViewCell class] forCellReuseIdentifier:@"btnCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"TwoBtnTableViewCell" bundle:nil] forCellReuseIdentifier:@"twoBtnCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"ThreeBtnTableViewCell" bundle:nil] forCellReuseIdentifier:@"threeBtnCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"FourBtnTableViewCell" bundle:nil] forCellReuseIdentifier:@"fourBtnCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Main_ListTableViewCell" bundle:nil] forCellReuseIdentifier:@"listCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Main_ListTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
}

- (void)setupNavigationBar
{
    self.navigationController.navigationBar.barTintColor = SELECT_TEXTCOLOR;
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem BarButtonItemWithTitle:@"地区" withFont:15 withImageName:@"arrow_down" withHightImageName:@"" withTarget:self withAction:@selector(addressClick) withFrame:CGRectMake(44, 10, 45, 44)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem BarButtonItemWithTitle:@"消息中心" withFont:11 withImageName:@"my_message_btn_n" withHightImageName:@"" withTarget:self withAction:@selector(messageClick) withFrame:CGRectMake(ScreenWidth - 15 - 40, 0, 30,40) withNumber:@"12"];
    UISearchBar *searchBar = [[UISearchBar alloc]init];
    //searchBar.searchBarStyle = UISearchBarStyleMinimal;
    searchBar.placeholder = @"搜索商品/店铺";
    self.navigationItem.titleView = searchBar;
}


- (void)addressClick
{
    NSLog(@"地址");
}

- (void)messageClick
{
    NSLog(@"消息");
}

#pragma mark - SearchBarViewDelegate Method
- (void)searchBarSearchButtonClicked:(SearchBarView *)searchBarView {
    NSLog(@"11111");
}

- (void)searchBarAudioButtonClicked:(SearchBarView *)searchBarView {
    NSLog(@"11111");
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", index);
}





#pragma mark  TableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 140 *ScreenWidth/375.0;
    }
    if (section == 1) {
        return 40;
    }
    return 50;
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
    
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, 140 *ScreenWidth/375.0) imageURLStringsGroup:_imgArray];
        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        //cycleScrollView.delegate = self;
         return cycleScrollView;
    }
    if (section == 1) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 30, 30)];
        //imgView.backgroundColor = [UIColor orangeColor];
        imgView.image = [UIImage imageNamed:@"首页_11"];
        [view addSubview:imgView];
        NewNoticeView *notice = [[NewNoticeView alloc]initWithFrame:CGRectMake(50, 0, ScreenWidth - 50, 40)];
        notice.backgroundColor = [UIColor clearColor];
        notice.noticeList = [NSMutableArray arrayWithObjects:
                                     @"小美眉抢到了一部iPhone8s!",
                                     @"小美眉又抢到了一部iPhone8s!",
                                     @"小美眉再次抢到了一部iPhone8s!",
                                     @"小美眉真幸运再次抢到了一部iPhone8s!",
                                     @"小美眉抢到了一部iPhone8s!", nil];
        [view addSubview:notice];
        return view;
    }
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
    
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
    [view addSubview:segmentedControl];
    return view;
   
}

//分类
- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"选中%ld", (long)segmentedControl.selectedSegmentIndex);
    _SelectedIndex = segmentedControl.selectedSegmentIndex;
    
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
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return Ratio(210);
        }
        if (indexPath.row == 1) {
            return Ratio(100);
        }

    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return Ratio(120);
        }
        if (indexPath.row == 1) {
            return Ratio(150);
        }
    }
    return Ratio(80);
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
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        if (indexPath.row == 1) {
            TwoBtnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"twoBtnCell" forIndexPath:indexPath];
            [cell.leftBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            ThreeBtnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"threeBtnCell" forIndexPath:indexPath];
            [cell.leftBtn addTarget:self action:@selector(threeLeftClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.rightTopBtn addTarget:self action:@selector(threeRightTopClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.rightBottomBtn addTarget:self action:@selector(threeRightBottomClick:) forControlEvents:UIControlEventTouchUpInside];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        if (indexPath.row == 1) {
            FourBtnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fourBtnCell" forIndexPath:indexPath];
            [cell.leftTopBtn addTarget:self action:@selector(leftTopClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.leftBottomBtn addTarget:self action:@selector(leftBottomClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.rightTopBtn addTarget:self action:@selector(rightTopClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.rightBottomBtn addTarget:self action:@selector(rightBottomClick:) forControlEvents:UIControlEventTouchUpInside];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        
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
