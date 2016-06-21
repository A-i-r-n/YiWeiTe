//
//  UIBarButtonItem+Extension.h
//  
//
//  Created by SYETC02 on 15/6/12.
//  Copyright (c) 2015年 SYETC02. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyButton.h"
#import "MessageButton.h"

@interface UIBarButtonItem (Extension)
//@property (nonatomic,assign)UIEdgeInsets *insets;

+ (instancetype)BarButtonItemWithTitle:(NSString *) title style:(UIBarButtonItemStyle) style target:(id)target action:(SEL) action;

+ (instancetype)BarButtonItemWithBackgroudImageName:(NSString *)backgroudImage highBackgroudImageName:(NSString *)highBackgroudImageName target:(id)target action:(SEL)action;
+ (instancetype)BarButtonItemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName imgEdgeInsets:(UIEdgeInsets)imgEdgeinsets title:(NSString *)title font:(CGFloat)font edgeInsets:(UIEdgeInsets)edgeinsets target:(id)target action:(SEL)action;

+ (instancetype)BarButtonItemWithTitle:(NSString *)title withFont:(CGFloat)font withImageName:(NSString *)imageName withHightImageName:(NSString *)heightImageName withTarget:(id)target withAction:(SEL)action withFrame:(CGRect)frame;

+ (instancetype)BarButtonItemWithTitle:(NSString *)title withFont:(CGFloat)font withImageName:(NSString *)imageName withHightImageName:(NSString *)heightImageName withTarget:(id)target withAction:(SEL)action withFrame:(CGRect)frame withNumber:(NSString *)number;

@end
