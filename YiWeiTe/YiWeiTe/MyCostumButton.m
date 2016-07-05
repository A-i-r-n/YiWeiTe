//
//  MyCostumButton.m
//  YiWeiTe
//
//  Created by daiqile on 16/6/7.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "MyCostumButton.h"

@implementation MyCostumButton

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
        _imgView = [[UIImageView alloc]init];
        [self addSubview:_imgView];
        _lab = [[UILabel alloc]init];
        _lab.font = [UIFont systemFontOfSize:14];
        _lab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_lab];
        
}
    return self;
}

- (void)layoutSubviews
{
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.left.offset(0);
        make.top.offset(0);
        //make.right.offset(0);
        make.centerX.equalTo(self.mas_centerX);
        make.width.equalTo(self.mas_width);
        make.height.equalTo(self.mas_width);
    }];
    [_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imgView.mas_bottom).offset(10);
        make.centerX.equalTo(_imgView.mas_centerX);
        //make.width.equalTo(self.mas_width).offset(25);
        //make.height.offset(20);
    }];
 
}

@end
