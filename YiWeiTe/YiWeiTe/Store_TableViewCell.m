//
//  Store_TableViewCell.m
//  YiWeiTe
//
//  Created by daiqile on 16/6/7.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Store_TableViewCell.h"
#import "ReleaseGoodsViewController.h"
@implementation Store_TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)knockdownClick:(id)sender
{
    NSLog(@"成交额");
    ReleaseGoodsViewController *release = [[ReleaseGoodsViewController alloc]init];
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [window.rootViewController presentViewController:release animated:YES completion:nil];
}

- (IBAction)visitorClick:(id)sender
{
    NSLog(@"访客");
}

- (IBAction)orderClick:(id)sender
{
    NSLog(@"订单");
}
@end
