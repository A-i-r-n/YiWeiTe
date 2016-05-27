//
//  Integral_ScrollTableViewCell.h
//  
//
//  Created by daiqile on 16/5/19.
//
//

#import <UIKit/UIKit.h>

@interface Integral_ScrollTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *IntegralLab;//积分数
@property (strong, nonatomic) IBOutlet UIImageView *IntegralImg;//积分图片
@property (strong, nonatomic) IBOutlet UILabel *label;//积分
@property (strong, nonatomic) IBOutlet UIImageView *exchangeImg;//兑换记录图片
@property (strong, nonatomic) IBOutlet UILabel *exchangeLab;//兑换记录label
@property (strong, nonatomic) IBOutlet UIImageView *ruleImg;
@property (strong, nonatomic) IBOutlet UILabel *ruleLab;



- (IBAction)IntegralBtnClick:(id)sender;//积分数方法
- (IBAction)exchangeBtnClick:(id)sender;//积分记录方法
- (IBAction)ruleBtnClick:(id)sender;//积分规则方法



@end
