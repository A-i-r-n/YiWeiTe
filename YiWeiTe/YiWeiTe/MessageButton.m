//
//  MessageButton.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/26.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "MessageButton.h"

@implementation MessageButton

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
        _img.image = [UIImage imageNamed:@"我的_15"];
        //_img.backgroundColor = [UIColor orangeColor];
        [self addSubview:_img];
        
        _numLab = [[UILabel alloc]init];
        _numLab.backgroundColor = [UIColor redColor];
        _numLab.layer.cornerRadius = 7.5;
        _numLab.text = @"3";
        _numLab.font = [UIFont systemFontOfSize:13];
        _numLab.textColor = [UIColor whiteColor];
        _numLab.textAlignment = NSTextAlignmentCenter;
        _numLab.clipsToBounds = YES;
        [self addSubview:_numLab];
        
        _titleLab = [[UILabel alloc]init];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLab];
        
        [_img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(5);
            make.right.offset(0);
            make.height.offset(20);
            make.width.offset(20);
        }];
        
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_img.mas_bottom);
            make.centerX.equalTo(_img.mas_centerX);
            make.bottom.offset(0);
            
        }];
        
        [_numLab mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(_img.mas_right).offset(-7.5);
            make.bottom.equalTo(_img.mas_top).offset(7.5);
            make.height.offset(15);
            make.width.offset(15);
        }];
        
    }
    return self;
    
}

@end
