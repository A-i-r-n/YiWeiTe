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
    if (self) {
        for (int i = 0 ; i<10; i++) {
            _button = [[ImageCenterButton alloc]initWithImage:_imgArray[i] withTitle:_titleArray[i] withTitleColor:SELECT_TEXTCOLOR withTitleFont:15.0];
            //button.backgroundColor = [UIColor redColor];
            CGFloat space = 10.0;
            CGFloat leftSpace = 15;
            CGFloat width = (ScreenWidth - leftSpace * 2 - space * 4)/5.0;
            CGFloat height = 80.0 * ScreenWidth / 375.0;
            _button.imageViewMaxSize = CGSizeMake(30, 30);
            _button.frame = CGRectMake(15 + i % 5 * (width + space)  , i / 5 * (space + width), width, height);
            _button.tag = 10 + i ;
            //_button.backgroundColor = [UIColor redColor];
            [self addSubview:_button];
        }

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
