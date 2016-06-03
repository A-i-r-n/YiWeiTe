//
//  Menubar.h
//  
//
//  Created by Terence on 15/10/19.
//  Copyright © 2015年 MT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuBarDelegate <NSObject>

@required
- (void) onMenuChanged:(NSInteger) index;

@end

@interface Menubar : NSObject

@property(nonatomic) int width;
@property(nonatomic) int height;
@property(nonatomic, strong) UIView* bar;
@property(nonatomic, strong) NSArray* datalist;
@property(nonatomic, strong) id<MenuBarDelegate> delegate;
@property(nonatomic) NSInteger selectedIndex;


+ (instancetype) menuWithView:(UIView*) view;
- (void) setSelectedIndex:(NSInteger)selectedIndex Trigger:(BOOL) bol;
- (void) setup;
- (void) dispose;


@end
