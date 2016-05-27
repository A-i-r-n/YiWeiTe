//
//  Cate_BtnTableViewCell.h
//  YiWeiTe
//
//  Created by daiqile on 16/5/26.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageCenterButton+MyImageCenterButton.h"
@interface Cate_BtnTableViewCell : UITableViewCell

@property(nonatomic,strong)NSMutableArray *imgArray;
@property(nonatomic,strong)NSMutableArray *titleArray;
@property(nonatomic,strong)ImageCenterButton *button;
@end
