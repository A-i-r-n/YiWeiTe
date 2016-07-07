//
//  StoreView.m
//  YiWeiTe
//
//  Created by daiqile on 16/7/7.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "StoreView.h"

@implementation StoreView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        _bgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg"]];
        [self addSubview:_bgView];
        
        _logoView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo"]];
        [self addSubview:_logoView];
        
        _sName = [[UILabel alloc]init];
        _sName.textColor = [UIColor whiteColor];
        _sName.text = @"Nike旗舰店";
        _sName.font = [UIFont systemFontOfSize:14];
        [self addSubview:_sName];
        
        _actionLab = [[UILabel alloc]init];
        _actionLab.textColor = [UIColor whiteColor];
        _actionLab.font = [UIFont systemFontOfSize:12];
        _actionLab.text = @"1.4万人关注";
        [self addSubview:_actionLab];
        
        _littleImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"little"]];
        [self addSubview:_littleImg];
        
        _actionBtn = [[UIButton alloc]init];
        [self addSubview:_actionBtn];
        _actionBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _actionBtn.backgroundColor = [UIColor redColor];
        [_actionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_actionBtn setTitle:@"+ 关注" forState:UIControlStateNormal];
        _actionBtn.layer.cornerRadius = 2;
        
        
        _sDetail = [[UIButton alloc]init];
        [self addSubview:_sDetail];
        
        
    }
    
    return self;
    
}

- (void)layoutSubviews

{
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.bottom.offset(0);
        make.right.offset(0);
        make.left.offset(0);
    }];
    
    [_logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-15);
        make.left.offset(10);
        make.height.offset(35);
        make.width.offset(90);
    }];
    
    [_sName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_logoView.mas_right).offset(8);
        make.top.equalTo(_logoView.mas_top);
    }];
    
    [_littleImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_sName.mas_right).offset(5);
        make.centerY.equalTo(_sName.mas_centerY);
        make.height.offset(15);
        make.width.offset(15);
    }];
    
    [_actionLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_sName.mas_left);
        make.bottom.equalTo(_logoView.mas_bottom);
    }];
    
    [_actionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-10);
        make.centerY.equalTo(_logoView.mas_centerY);
        make.height.offset(20);
        make.width.offset(50);
    }];
    
    [_sDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_logoView.mas_top).offset(-15);
        make.bottom.equalTo(_logoView.mas_bottom).offset(10);
        make.left.offset(10);
        make.width.offset(240);
    }];
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
