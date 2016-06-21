//
//  MyButton.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/26.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _img = [[UIImageView alloc]init];
        _img.image = [UIImage imageNamed:@"arrow_down"];
        [self addSubview:_img];
        
        _titleLab = [[UILabel alloc]init];
        _titleLab.text = @"地区";
        _titleLab.font = [UIFont systemFontOfSize:14];
        [self addSubview:_titleLab];
        
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
            make.left.offset(0);
            make.height.offset(25);
            make.width.offset(30);
        }];
        
        [_img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
            make.left.equalTo(_titleLab.mas_right).offset(5);
            make.width.offset(10);
            make.height.offset(6);
        }];
        
    }
    return self;
    
}


@end
