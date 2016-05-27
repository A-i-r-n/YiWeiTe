//
//  ImageCenterButton+MyImageCenterButton.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/13.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "ImageCenterButton+MyImageCenterButton.h"

@implementation ImageCenterButton (MyImageCenterButton)
- (ImageCenterButton *)initWithImage:(NSString *)imageName withTitle:(NSString *)title withTitleColor:(UIColor *)titleColor withTitleFont:(CGFloat)font
{
    
    self = [super init];
    if (self) {
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        self.titleLabel.font =[UIFont systemFontOfSize:font];
    }
    return self;
    
}

@end
