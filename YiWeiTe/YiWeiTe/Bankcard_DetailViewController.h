//
//  Bankcard_DetailViewController.h
//  YiWeiTe
//
//  Created by daiqile on 16/5/23.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Bankcard_DetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *logoImg;//银行logo
@property (strong, nonatomic) IBOutlet UILabel *bankNameLab;//银行名称
@property (strong, nonatomic) IBOutlet UILabel *bankNumLab;//银行卡后4位
@property (strong, nonatomic) IBOutlet UILabel *styleLab;//银行卡类型
@property (strong, nonatomic) IBOutlet UILabel *cardNameLab;//持卡人姓名
@property (strong, nonatomic) IBOutlet UILabel *phoneLab;//预留手机号
- (IBAction)revokeBtnClick:(id)sender;

@end
