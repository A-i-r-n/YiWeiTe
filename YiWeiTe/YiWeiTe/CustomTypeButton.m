//
//  CustomTypeButton.m
//  BeautifulLife
//
//  Created by 鼎鼎 on 15/10/27.
//  Copyright (c) 2015年 河南鼎鼎物业. All rights reserved.
//

#import "CustomTypeButton.h"

@implementation CustomTypeButton
const double IWCustomImageRatio = 0.5;
#define IWTabBarButtonTitleSelectedColor Color(3, 84, 108)

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.图片居中
        self.imageView.contentMode = UIViewContentModeScaleToFill;
         self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
        self.titleLabel.numberOfLines=0;
        // 2.文字居中
     
        [self setTitleColor:SELECT_TEXTCOLOR forState:UIControlStateNormal];
     
           }
    return self;
}

//pragma mark - 覆盖父类的2个方法
#pragma mark 设置按钮标题的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleY = contentRect.size.height * IWCustomImageRatio;
    CGFloat titleH = contentRect.size.height - titleY;
    CGFloat titleW = contentRect.size.width;
    
   return CGRectMake(0, titleY, titleW,  titleH);
    
}

#pragma mark 设置按钮图片的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageH = contentRect.size.height * (1 - IWCustomImageRatio)-15;
    //CGFloat imageW = contentRect.size.width;
    //CGFloat width= self.currentImage.size.width;

    return CGRectMake((contentRect.size.width-imageH)/2.0,10 , imageH,  imageH - 2);
}



@end
