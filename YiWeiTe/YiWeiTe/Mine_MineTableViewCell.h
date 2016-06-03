//
//  Mine_MineTableViewCell.h
//  YiWeiTe
//
//  Created by daiqile on 16/5/13.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Mine_MineTableViewCell : UITableViewCell

@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) UIViewController *viewController;

@property (strong, nonatomic) IBOutlet UIButton *logoBtn;//个人头像
@property (strong, nonatomic) IBOutlet UILabel *nameLab;//用户名
@property (strong, nonatomic) IBOutlet UIImageView *imgImage;//用户名后的小图
@property (strong, nonatomic) IBOutlet UILabel *balanceLab;//余额
@property (strong, nonatomic) IBOutlet UILabel *numberLab;//余额数
@property (strong, nonatomic) IBOutlet UILabel *ticketLab;//优惠券
@property (strong, nonatomic) IBOutlet UILabel *numberTic;//优惠券数
@property (strong, nonatomic) IBOutlet UILabel *numIntegralLab;//积分
@property (strong, nonatomic) IBOutlet UILabel *integralLab;//积分数



- (IBAction)settingClick:(id)sender;//设置
- (IBAction)messageClick:(id)sender;//消息
- (IBAction)balanceClick:(id)sender;//余额
- (IBAction)ticketClick:(id)sender;//优惠券
- (IBAction)integralClick:(id)sender;//积分


@end
