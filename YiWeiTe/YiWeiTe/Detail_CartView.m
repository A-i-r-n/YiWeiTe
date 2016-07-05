//
//  Detail_CartView.m
//  YiWeiTe
//
//  Created by daiqile on 16/6/29.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Detail_CartView.h"


@implementation Detail_CartView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _connectBtn = [[MessageButton alloc]init];
        _connectBtn.titleLab.text = @"联系卖家";
        _connectBtn.img.image = [UIImage imageNamed:@"联系卖家"];
        _connectBtn.numLab.hidden = YES;
        [self addSubview:_connectBtn];
        
        _storeBtn = [[MessageButton alloc]init];
        //_storeBtn.backgroundColor = [UIColor redColor];
        _storeBtn.titleLab.text = @"店铺";
        _storeBtn.img.image = [UIImage imageNamed:@"店铺"];
        _storeBtn.numLab.hidden = YES;
        [self addSubview:_storeBtn];
        
        _careBtn = [[MessageButton alloc]init];
        _careBtn.titleLab.text = @"关注";
        _careBtn.img.image = [UIImage imageNamed:@"关注-1"];
        _careBtn.numLab.hidden = YES;
        [self addSubview:_careBtn];
        
        _cartBtn = [[MessageButton alloc]init];
        _cartBtn.titleLab.text = @"购物车";
        _cartBtn.img.image = [UIImage imageNamed:@"购物车"];
        _cartBtn.numLab.text = @"10";
        [self addSubview:_cartBtn];
        
        _addCartBtn = [[UIButton alloc]init];
        _addCartBtn.backgroundColor = SELECT_TEXTCOLOR;
        [_addCartBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
        [self addSubview:_addCartBtn];

    }
    return self;
}

- (void)layoutSubviews
{
    [_connectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.height.equalTo(self.mas_height);
        make.width.offset((ScreenWidth * 0.6)/4.0 - 10);
        make.left.offset(10);
    }];
    
    [_storeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_connectBtn.mas_centerY);
        make.left.equalTo(_connectBtn.mas_right).offset(10);
        make.height.equalTo(_connectBtn.mas_height);
        make.width.equalTo(_connectBtn.mas_width);
    }];
    
    [_careBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_storeBtn.mas_centerY);
        make.left.equalTo(_storeBtn.mas_right).offset(10);
        make.height.equalTo(_storeBtn.mas_height);
        make.width.equalTo(_storeBtn.mas_width);
    }];
    
    [_cartBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_careBtn.mas_centerY);
        make.left.equalTo(_careBtn.mas_right).offset(10);
        make.height.equalTo(_careBtn.mas_height);
        make.width.equalTo(_careBtn.mas_width);
    }];
    
    [_addCartBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_cartBtn.mas_centerY);
        make.left.equalTo(_cartBtn.mas_right).offset(10);
        make.right.offset(0);
        make.height.equalTo(_cartBtn.mas_height);
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
