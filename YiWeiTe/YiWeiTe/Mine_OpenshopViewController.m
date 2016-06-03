//
//  Mine_OpenshopViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/17.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Mine_OpenshopViewController.h"
#import "Personal_OpenViewController.h"
#import "Company_OpenViewController.h"

@interface Mine_OpenshopViewController ()

@end

@implementation Mine_OpenshopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = NO;
    [self createNavigation];
}

- (void)createNavigation
{
    self.title = @"我要开店";
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnClick)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)leftBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//个人开店
- (IBAction)personBtn:(id)sender
{
    Personal_OpenViewController *personal = [[Personal_OpenViewController alloc]init];
    [self.navigationController pushViewController:personal animated:YES];
}

//企业开店
- (IBAction)companyBtn:(id)sender
{
    Company_OpenViewController *company = [[Company_OpenViewController alloc]init];
    [self.navigationController pushViewController:company animated:YES];
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
