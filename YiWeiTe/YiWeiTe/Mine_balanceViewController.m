//
//  Mine_balanceViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/31.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Mine_balanceViewController.h"


@interface Mine_balanceViewController ()
@property(nonatomic,strong)UIBarButtonItem *leftItem;
@property(nonatomic,strong)UINavigationController *navigation;
@property(nonatomic,strong)UIButton *button;
@end

@implementation Mine_balanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
}


- (IBAction)balanceClick:(id)sender
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
