//
//  UIView+AirExtension.h
//  YiWeiTe
//
//  Created by daiqile on 16/5/10.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AirExtension)

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

/**
 *  从Xib中加载一个控件出来（Xib的名字和类名一致）
 */
+ (instancetype)viewFromXib;

@end
