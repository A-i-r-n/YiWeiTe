//
//  DetailViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/6/15.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "DetailViewController.h"

#import "Detail_ImgTableViewCell.h"
#import "Detail_ExplainTableViewCell.h"
#import "Cart_TFTableViewCell.h"
#import "Detail_AddressTableViewCell.h"
#import "Detail_EnsureTableViewCell.h"
#import "Detail_CommentTableViewCell.h"
#import "Detail_StoreTableViewCell.h"
#import "Detail_BtnTableViewCell.h"
#import "Detail_DImgTableViewCell.h"

#import "AddrListViewController.h"
#import "Detai_Addresslview.h"

#import "AddrDataModel.h"

@interface DetailViewController ()<UITableViewDataSource,UITableViewDelegate,QXActionSheetDelegate>

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"商品详情";
    [self createNavigation];
    [self registCell];
}

- (void)registCell
{
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    _tableView.showsVerticalScrollIndicator = NO;
    [_tableView registerNib:[UINib nibWithNibName:@"Detail_ImgTableViewCell" bundle:nil] forCellReuseIdentifier:@"imgCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Detail_ExplainTableViewCell" bundle:nil] forCellReuseIdentifier:@"explainCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Cart_TFTableViewCell" bundle:nil] forCellReuseIdentifier:@"tfCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Detail_AddressTableViewCell" bundle:nil] forCellReuseIdentifier:@"addCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Detail_EnsureTableViewCell" bundle:nil] forCellReuseIdentifier:@"sureCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Detail_CommentTableViewCell" bundle:nil] forCellReuseIdentifier:@"comCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Detail_StoreTableViewCell" bundle:nil] forCellReuseIdentifier:@"storeCell"];
    [_tableView registerClass:[Detail_BtnTableViewCell class] forCellReuseIdentifier:@"btnCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"Detail_DImgTableViewCell" bundle:nil] forCellReuseIdentifier:@"dImgCell"];
    
    
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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [_tableView reloadData];
}

#pragma mark tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0 || section == 2) {
        return 2;
    }
    if (section == 5) {
        return 10;
    }
    return 1;
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
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return Ratio(320);
        }
        if (indexPath.row == 1) {
            return Ratio(130);
        }
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            return Ratio(95);
        }
        if (indexPath.row == 1) {
            return Ratio(35);
        }
    }
    if (indexPath.section == 3) {
        return Ratio(300);
    }
    if (indexPath.section == 4) {
        return Ratio(170);
    }
    if (indexPath.section == 5) {
        if (indexPath.row == 0) {
            return Ratio(44);
        }
        return Ratio(140);
    }
    return Ratio(44);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            Detail_ImgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imgCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        if (indexPath.row == 1) {
            Detail_ExplainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"explainCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            return cell;
        }
    }
    if (indexPath.section == 1) {
        Cart_TFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tfCell"];
        cell.leftLab.text = @"已选";
        cell.leftLab.textColor = [UIColor blackColor];
        cell.rightTf.text = @"白色/537204C,40/8.5,一个";
        cell.rightTf.userInteractionEnabled = NO;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            Detail_AddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            return cell;
        }
        
        Detail_EnsureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sureCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }
    if (indexPath.section == 3) {
        Detail_CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"comCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }
    if (indexPath.section == 4) {
        Detail_StoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"storeCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.section == 5) {
        if (indexPath.row == 0) {
            Detail_BtnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"btnCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }
    Detail_DImgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dImgCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        self.ActionSheet = [[QXActionSheet alloc] initWithHeight:ScreenHeight*0.75 isNeedPerspective:YES];
        self.ActionSheet.delegate = self;
        [self.view addSubview:self.ActionSheet];
        
        //[self.ActionSheet.contentView addSubview:showView];
        
        self.navigationController.navigationBarHidden = YES;
    }
    
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {

           AddrListViewController *addrList = [[AddrListViewController alloc]init];
            [self.navigationController pushViewController:addrList animated:YES];
            
            
        }
    }
}

#pragma mark - QXActionSheetDelegate
- (void)actionSheetWillClose:(QXActionSheet*)actionSheet
{
    NSLog(@"actionSheetWillClose");
}
- (void)actionSheetDidClose:(QXActionSheet*)actionSheet
{
    NSLog(@"actionSheetDidClose");
    self.navigationController.navigationBarHidden = NO;
    self.ActionSheet = nil;
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
