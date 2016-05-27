//
//  NavigationView.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/11.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "NavigationView.h"
#import "UIButton+LXMImagePosition.h"
@implementation NavigationView

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
        _leftBtn = [[UIButton alloc]init];
        [_leftBtn setImage:[UIImage imageNamed:@"first_normal"] forState:UIControlStateNormal];
        //_leftBtn.imageView.image = [UIImage imageNamed:@"first_normal"];
        _leftBtn.titleLabel.font = [UIFont systemFontOfSize:15];
//        _leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 5);
//        _leftBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
        [_leftBtn setImagePosition:LXMImagePositionLeft spacing:-60.0];
        [_leftBtn setTitle:@"地区" forState:UIControlStateNormal];
        [_leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:_leftBtn];
        
        _searchBar = [[UISearchBar alloc]init];
        _searchBar.searchBarStyle = UISearchBarStyleMinimal;
        _searchBar.placeholder = @"搜索商品/店铺";
        [self addSubview:_searchBar];
        
        _rightBtn = [[UIButton alloc]init];
        [_rightBtn setImage:[UIImage imageNamed:@"first_normal"] forState:UIControlStateNormal];
        _rightBtn.imageEdgeInsets = UIEdgeInsetsMake(-5, 18, 5, 5);
        _rightBtn.titleEdgeInsets = UIEdgeInsetsMake(5, -22, -25, 0);
        _rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _rightBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_rightBtn setTitle:@"消息" forState:UIControlStateNormal];
        [self addSubview:_rightBtn];
        
        [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(10);
            make.top.offset(10);
            make.height.offset(44);
            make.width.offset(80);
            
        }];
        
        [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_leftBtn.mas_centerY);
            make.left.equalTo(_leftBtn.mas_right).offset(-10);
            make.right.equalTo(_rightBtn.mas_left).offset(10);
            //make.height.offset(44);
        }];
        
        [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_searchBar.mas_centerY);
            make.top.offset(10);
            make.right.offset(-10);
           // make.height.offset(54);
            make.width.offset(60);
        }];

        
    }
    return self;
}


@end
