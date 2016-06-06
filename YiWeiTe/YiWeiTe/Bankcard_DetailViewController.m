//
//  Bankcard_DetailViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/23.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Bankcard_DetailViewController.h"

@interface Bankcard_DetailViewController ()

@end

@implementation Bankcard_DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = BGCOLOR;
    [self createNavigation];
}

- (void)createNavigation
{
    self.title = @"银行卡详情";
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnClick)];
    self.navigationItem.leftBarButtonItem = leftItem;
}



- (void)leftBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

//解除绑定银行卡按钮
- (IBAction)revokeBtnClick:(id)sender
{
    // 1.实例化alert:alertControllerWithTitle
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"您确定要解除绑定该银行卡吗?" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [self presentViewController:alertController animated:YES completion:nil];

    //取消绑定
    UIAlertAction *affirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"确定");
    }];
    
    //不取消绑定
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"取消");
        
    }];
    
    [alertController addAction:affirm];
    [alertController addAction:cancel];
    
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
