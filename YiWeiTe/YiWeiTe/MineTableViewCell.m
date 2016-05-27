
//
//  MineTableViewCell.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/13.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "MineTableViewCell.h"

@implementation MineTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    NSMutableArray *titleArray = [NSMutableArray arrayWithObjects:@"待付款",@"待收货",@"待评价",@"退款/售后", nil];
    NSMutableArray *imgArray = [NSMutableArray arrayWithObjects:@"我的_1",@"我的_2",@"我的_3",@"我的_4", nil];
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        for (int i = 0 ; i<4; i++) {
            _button = [[ImageCenterButton alloc]initWithImage:imgArray[i] withTitle:titleArray[i] withTitleColor:SELECT_TEXTCOLOR withTitleFont:13.0];
            //button.backgroundColor = [UIColor redColor];
            CGFloat space = 20.0;
            CGFloat leftSpace = 15;
            CGFloat width = (ScreenWidth - leftSpace * 2 - space * 3)/4.0;
            CGFloat height = 80.0 * ScreenWidth / 375.0;
            
            //_button.backgroundColor = [UIColor redColor];
            _button.frame = CGRectMake(15 + i * (width + space)  , -3, width, height);
            _button.imageViewMaxSize = CGSizeMake(30, 35);
//            _button.titleLabel.frame = [_button titleRectForContentRect:CGRectMake(5, 40, width, 25)];
           //[_button imageRectForContentRect:CGRectMake(5, 5, 40, 40)];
//            _button.imageView.image = [UIImage imageNamed:[imgArray objectAtIndex:i]];
//            [_button setImage:[UIImage imageNamed:imgArray[i]] forState:UIControlStateNormal];
//            [_button setTitle:titleArray[i] forState:UIControlStateNormal];
            //_button.titleLabel.text = titleArray[i];
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
