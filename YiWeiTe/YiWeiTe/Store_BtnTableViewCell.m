//
//  Store_BtnTableViewCell.m
//  YiWeiTe
//
//  Created by daiqile on 16/6/7.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Store_BtnTableViewCell.h"


@implementation Store_BtnTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        float leftSpace = 20;
        float space = 30;
        float width = (ScreenWidth - leftSpace * 2 - space * 3) / 4.0;
        NSLog(@"%f",width);
        NSMutableArray *imgArray = [NSMutableArray arrayWithObjects:@"我的店铺_发布宝贝",@"我的店铺_宝贝管理",@"我的店铺_订单管理",@"我的店铺_我要代理",@"我的店铺_店铺装修",@"我的店铺_设置", nil];
        NSMutableArray *labArray = [NSMutableArray arrayWithObjects:@"发布宝贝",@"宝贝管理",@"订单管理",@"我要代理",@"店铺装修",@"设置", nil];

        for (int i = 0; i<6; i++) {
            _button = [[MyCostumButton alloc]init];
            _button.tag = 10+i;
            _button.frame = CGRectMake((leftSpace + i % 4 * (width + space)), (leftSpace  + i / 4 * (width + space + 25.0)), width, width);
            NSLog(@"%@",_button);
            _button.imgView.image = [UIImage imageNamed:imgArray[i]];
            _button.lab.text = labArray[i];
            [self addSubview:_button];
        }
        
        
        
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
