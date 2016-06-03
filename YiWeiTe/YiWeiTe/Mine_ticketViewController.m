//
//  Mine_ticketViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/31.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Mine_ticketViewController.h"
#import "Menubar.h"
#import "TicketTableViewCell.h"

@interface Mine_ticketViewController ()<UITableViewDataSource,UITableViewDelegate,MenuBarDelegate>

@property(nonatomic,strong)Menubar *menubar;

@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation Mine_ticketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_tableView registerNib:[UINib nibWithNibName:@"TicketTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    _dataArray = [NSMutableArray arrayWithObjects:@"精选",@"食品饮料",@"家用电器",@"运动户外",@"服饰内衣",@"家居家纺",@"电脑办公",@"图书影音",@"个护化妆",@"鞋靴箱包",@"手机数码",@"母婴用品",@"承认保健",@"汽车用品",@"珠宝钟表",@"其他", nil];
    [self onInitMenu];
    
    

}

- (void) onInitMenu
{
    _slide_View.backgroundColor = [UIColor blackColor];
    _menubar = [Menubar menuWithView:_slide_View];
    
    _menubar.datalist = _dataArray;
    _menubar.delegate = self;
    [_menubar setSelectedIndex:0 Trigger:YES];
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
    return 100 * ScreenWidth / 375.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TicketTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}


- (void) onMenuChanged:(NSInteger) index
{
    
}

- (IBAction)backClick:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
