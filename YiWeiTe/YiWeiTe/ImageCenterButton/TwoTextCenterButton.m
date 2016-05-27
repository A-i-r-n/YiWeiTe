//
//  ImageCenterBtn.m
//  ButtonTopImage
//
//  Created by AliThink on 15/9/16.
//  Copyright (c) 2015年 AliThink. All rights reserved.
//

// This code is distributed under the terms and conditions of the MIT license.

// Copyright (c) 2015 AliThink
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#import "TwoTextCenterButton.h"

#define IMAGECENTERBUTTON_IMAGE_TEXT_SPACING 5.0
#define IMAGECENTERBUTTON_TITLE_MIN_HEIGHT   14.0
#define IMAGECENTERBUTTON_PADDING_MIN        8.0
@interface TwoTextCenterButton()
@end

@implementation TwoTextCenterButton

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self addAction];
    }
    return self;
}

- (instancetype)init{
    self = [super init];
    
    for(UIView *view in [self subviews])[view removeFromSuperview];
 
    self.backgroundColor=[UIColor whiteColor];
    if (self) {
        if (!_oneText) {
            _oneText=[[UILabel alloc] init];
            _oneText.text=@"";
//            _oneText.font=[UIFont systemFontOfSize:12];
            [self addSubview:_oneText];
        }
        if (!_twoText) {
            _twoText=[[UILabel alloc] init];
            _twoText.text=@"";
            _twoText.font=[UIFont systemFontOfSize:12];
            [self addSubview:_twoText];
        }
        [self addAction];
    }
    return self;
}

- (void)addAction {
    [self addTarget:self action:@selector(pressed:) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpOutside];
    [self addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchCancel];
}
-(void)setTitleColor:(UIColor *)color{
    _oneText.textColor=color;
}
-(void)setTipColor:(UIColor *)color{
    _twoText.textColor=color;
}
-(void)setTitle:(NSString *)one{
    _oneText.text=one;
}
-(void)setTitle:(NSString* )one two:(NSString *)two{
    _oneText.text=one;
    _twoText.text=two;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
//    self.adjustsImageWhenHighlighted = NO;
    
    if (!self.padding) {
        self.padding = IMAGECENTERBUTTON_PADDING_MIN;
    }
    
    if (!self.textSpace) {
        self.textSpace = IMAGECENTERBUTTON_IMAGE_TEXT_SPACING;
    }
    
    CGFloat titleLabelHeight = self.twoText.frame.size.height;
    if (titleLabelHeight == 0) {
        titleLabelHeight = IMAGECENTERBUTTON_TITLE_MIN_HEIGHT;
    }
    
    CGFloat imageMaxHeight = self.frame.size.height - titleLabelHeight - self.textSpace - self.padding * 2;
    CGFloat imageMaxWidth = self.frame.size.width - self.padding * 2;
    
    if (self.imageViewMaxSize.height) {
        imageMaxHeight = self.imageViewMaxSize.height;
    }
    if (self.imageViewMaxSize.width) {
        imageMaxWidth = self.imageViewMaxSize.width;
    }
    
    
    CGFloat totalHeight = titleLabelHeight  + titleLabelHeight+_textSpace;
    
    //Center one
    CGPoint center = self.oneText.center;
    center.x = self.frame.size.width / 2.0;
    center.y = self.frame.size.height / 2.0 - totalHeight / 2.0 + titleLabelHeight / 2.0;
    self.oneText.center = center;

    CGRect oneLabelFrame = self.oneText.frame;
    oneLabelFrame.size = CGSizeMake(self.frame.size.width, titleLabelHeight);
    self.oneText.frame = oneLabelFrame;
    

    
    //Center two
    CGRect titleLabelFrame = self.twoText.frame;
    titleLabelFrame.size = CGSizeMake(self.frame.size.width, titleLabelHeight);
    self.twoText.frame = titleLabelFrame;
    
    CGPoint titleCenter = self.twoText.center;
    titleCenter.x = self.frame.size.width / 2.0;
    titleCenter.y = self.oneText.center.y + self.oneText.frame.size.height / 2.0 + titleLabelHeight / 2.0+_textSpace;
    self.twoText.center = titleCenter;
    
    self.oneText.textAlignment = NSTextAlignmentCenter;
    self.twoText.textAlignment = NSTextAlignmentCenter;
}

- (void)pressed:(UIButton *)btn {
    if (self.backgroundHighlightedColor) {
        [btn setBackgroundColor:self.backgroundHighlightedColor];
    } else {
        [btn setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1]];
    }
}

- (void)touchUp:(UIButton *)btn {
    if (self.backgroundNormalColor) {
        [btn setBackgroundColor:self.backgroundNormalColor];
    } else {
        [btn setBackgroundColor:[UIColor whiteColor]];
    }
}


@end
