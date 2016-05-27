//
//  Cate_SliderTableViewCell.h
//  YiWeiTe
//
//  Created by daiqile on 16/5/26.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLCustomSlideView.h"
@interface Cate_SliderTableViewCell : UITableViewCell<DLTabedSlideViewDelegate>
@property (nonatomic,strong) DLTabedSlideView *tabedSlideView;
@property(nonatomic,strong)UIViewController *viewController;
@end
