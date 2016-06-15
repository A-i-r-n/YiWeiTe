//
//  Cate_BtnTableViewCell.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/26.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Cate_BtnTableViewCell.h"

@implementation Cate_BtnTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

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
                  nil];
    
    _titleArray = [NSMutableArray arrayWithObjects:@"自助餐",@"中餐",@"西餐",@"火锅",@"日韩料理",@"小吃快餐",@"甜点饮品",@"烧烤",nil];
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        CGFloat leftSpace = 30;
        CGFloat space = 45;
        CGFloat width = (ScreenWidth - leftSpace * 2 - space * 3) / 4.0;
        for (int i = 0; i<8; i++) {
            _button = [[MyCostumButton alloc]init];
            _button.tag = 10+i;
            _button.frame = CGRectMake(leftSpace + i % 4 * (width + space), 10  + i / 4 * (width + space), width, width + 25);
            _button.imgView.image = [UIImage imageNamed:_imgArray[i]];
            _button.lab.text = _titleArray[i];
            [self addSubview:_button];
        }

        
//        for (int i = 0 ; i<8; i++) {
//            _button = [[ImageCenterButton alloc]initWithImage:_imgArray[i] withTitle:_titleArray[i] withTitleColor:SELECT_TEXTCOLOR withTitleFont:15.0];
//            //button.backgroundColor = [UIColor redColor];
//            CGFloat space = 10.0;
//            CGFloat topSpace = -5;
//            CGFloat leftSpace = 15;
//            CGFloat width = (ScreenWidth - leftSpace * 2 - space * 3)/4.0;
//            CGFloat height = width;//70.0 * ScreenWidth / 375.0;
//            _button.imageViewMaxSize = CGSizeMake(30, 30);
//            _button.frame = CGRectMake(15 + i % 4 * (width + space)  , i / 4 * (topSpace + width), width, height);
//            _button.tag = 10 + i ;
//            //_button.backgroundColor = [UIColor redColor];
//            [self addSubview:_button];
//        }
        
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
