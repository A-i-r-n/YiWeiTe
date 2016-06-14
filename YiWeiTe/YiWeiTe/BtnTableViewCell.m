//
//  BtnTableViewCell.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/11.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "BtnTableViewCell.h"


@implementation BtnTableViewCell

//- (NSMutableArray *)imgArray
//{
//    if (!_imgArray) {
//        
//    }
//    return _imgArray;
//}
//
//- (NSMutableArray *)titleArray
//{
//    if (!_titleArray) {
//       
//    }
//    return _titleArray;
//}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    _imgArray = [NSMutableArray arrayWithObjects:@"首页_1",
                 @"首页_2",
                 @"首页_3",
                 @"首页_4",
                 @"首页_5",
                 @"首页_6",
                 @"首页_7",
                 @"首页_8",
                 @"首页_9",
                 @"首页_10", nil];

     _titleArray = [NSMutableArray arrayWithObjects:@"美食",@"酒店",@"休闲娱乐",@"丽人",@"母婴",@"超市",@"穿搭",@"一元夺宝",@"购物车",@"生活服务", nil];
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    CGFloat leftSpace = 15;
    CGFloat space = 25;
    CGFloat width = (ScreenWidth - leftSpace * 2 - space * 4) / 5.0;
    for (int i = 0; i<10; i++) {
        _button = [[MyCostumButton alloc]init];
        _button.tag = 10+i;
        _button.frame = CGRectMake(leftSpace + i % 5 * (width + space), leftSpace  + i / 5 * (width + space + 25), width, width + 25);
        _button.lab.font = [UIFont systemFontOfSize:12];
        _button.imgView.image = [UIImage imageNamed:_imgArray[i]];
        _button.lab.text = _titleArray[i];
        [self addSubview:_button];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
