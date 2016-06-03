//
//  Mine_MineTableViewCell.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/13.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Mine_MineTableViewCell.h"
#import "Mine_balanceViewController.h"
#import "Mine_JFViewController.h"
#import "Mine_ticketViewController.h"

@implementation Mine_MineTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//设置
- (IBAction)settingClick:(id)sender
{
    
}

//消息
- (IBAction)messageClick:(id)sender
{
    
}

//余额
- (IBAction)balanceClick:(id)sender
{
    NSLog(@"余额");
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    Mine_balanceViewController *balance = [[Mine_balanceViewController alloc]init];
    [window.rootViewController presentViewController:balance animated:YES completion:nil];
    
}

//积分
- (IBAction)integralClick:(id)sender
{
    NSLog(@"积分");
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    Mine_JFViewController *jf = [[Mine_JFViewController alloc]init];
    [window.rootViewController presentViewController:jf animated:YES completion:nil];
}

//优惠券
- (IBAction)ticketClick:(id)sender
{
    NSLog(@"优惠券");
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    Mine_ticketViewController *ticket = [[Mine_ticketViewController alloc]init];
    [window.rootViewController presentViewController:ticket animated:YES completion:nil];
}
@end
