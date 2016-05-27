//
//  BalanceViewController.h
//  YiWeiTe
//
//  Created by daiqile on 16/5/23.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BalanceViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *moneyLab;
- (IBAction)rechargeClick:(id)sender;
- (IBAction)cashClick:(id)sender;

@end
