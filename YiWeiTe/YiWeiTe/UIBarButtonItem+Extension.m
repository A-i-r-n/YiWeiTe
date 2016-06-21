//
//  UIBarButtonItem+Extension.m
//
//
//  Created by SYETC02 on 15/6/12.
//  Copyright (c) 2015年 SYETC02. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"



@implementation UIBarButtonItem (Extension)

+ (instancetype)BarButtonItemWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action
{
    
    return [[self alloc] initWithTitle:title style:style target:target action:action];
    
}

+ (instancetype)BarButtonItemWithBackgroudImageName:(NSString *)backgroudImage highBackgroudImageName:(NSString *)highBackgroudImageName target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundImage:[UIImage imageWithName:backgroudImage] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithName:highBackgroudImageName] forState:UIControlStateHighlighted];
  
    // 设置按钮的尺寸为背景图片的尺寸
    button.size = button.currentBackgroundImage.size;
    
    // 监听按钮点击
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
}
/**
 *  设置tarbuttoonItem
 *
 *  @param imageName     图片名称
 *  @param highImageName 高亮图片名称
 *  @param title         标题
 *  @param target        回调对象
 *  @param action        回调方法
 *
 *  @return UIBarButtonItem
 */
+ (instancetype)BarButtonItemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName imgEdgeInsets:(UIEdgeInsets)imgEdgeinsets title:(NSString *)title font:(CGFloat)font edgeInsets:(UIEdgeInsets)edgeinsets target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    
    [button setImage:[UIImage imageWithName:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageWithName:highImageName] forState:UIControlStateHighlighted];
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:nil forState:UIControlStateHighlighted];
        button.titleLabel.font =[UIFont fontWithName:@"Helvetica-Bold" size:font ];
        
    }
    
    // 设置按钮的尺寸为背景图片的尺寸+文字大小
    button.width = [title sizeWithFont:[UIFont systemFontOfSize:font] maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)].width;
    button.height = button.currentImage.size.height+[title sizeWithFont:button.titleLabel.font maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)].height;
    [button setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];
    //设置title在button上的位置（上top，左left，下bottom，右right）
    button.titleEdgeInsets = edgeinsets;//UIEdgeInsetsMake(30,-30, 0, 0);
    button.imageEdgeInsets = imgEdgeinsets;
    // 监听按钮点击
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
}

+ (instancetype)BarButtonItemWithTitle:(NSString *)title withFont:(CGFloat)font withImageName:(NSString *)imageName withHightImageName:(NSString *)heightImageName withTarget:(id)target withAction:(SEL)action withFrame:(CGRect)frame 
{
    MyButton *button = [[MyButton alloc]init];
    button.frame = frame;
    button.img.image = [UIImage imageWithName:imageName];
    button.titleLab.text = title;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:nil forState:UIControlStateHighlighted];
    button.titleLabel.font =[UIFont fontWithName:@"Helvetica-Bold" size:font ];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];

}

+ (instancetype)BarButtonItemWithTitle:(NSString *)title withFont:(CGFloat)font withImageName:(NSString *)imageName withHightImageName:(NSString *)heightImageName withTarget:(id)target withAction:(SEL)action withFrame:(CGRect)frame withNumber:(NSString *)number
{
    MessageButton *button = [[MessageButton alloc]init];
    button.frame = frame;
    button.img.image = [UIImage imageWithName:imageName];
    button.titleLab.text = title;
    button.titleLab.font = [UIFont systemFontOfSize:font];
    button.numLab.text = number;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:nil forState:UIControlStateHighlighted];
    button.titleLabel.font =[UIFont fontWithName:@"Helvetica-Bold" size:font ];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
}

@end
