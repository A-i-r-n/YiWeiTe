//
//  Mine_StoreTableViewCell.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/13.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Mine_StoreTableViewCell.h"

@implementation Mine_StoreTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    NSMutableArray *titleArray = [NSMutableArray arrayWithObjects:@"积分商城",@"我的分享",@"会员中心",@"我要开店", nil];
    NSMutableArray *imgArray = [NSMutableArray arrayWithObjects:@"我的_9",@"我的_10",@"我的_11",@"我的_12", nil];
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        for (int i = 0 ; i<4; i++) {
            _button = [[ImageCenterButton alloc]initWithImage:imgArray[i] withTitle:titleArray[i] withTitleColor:SELECT_TEXTCOLOR withTitleFont:15.0];
            //button.backgroundColor = [UIColor redColor];
            CGFloat space = 20.0;
            CGFloat leftSpace = 15;
            CGFloat width = (ScreenWidth - leftSpace * 2 - space * 3)/4.0;
            CGFloat height = 80.0 * ScreenWidth / 375.0;
            _button.imageViewMaxSize = CGSizeMake(30, 35);
            _button.frame = CGRectMake(15 + i * (width + space)  , -3, width, height);
            _button.tag = 10 + i ;
            [self addSubview:_button];
        }
        
    }
    return self ;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
