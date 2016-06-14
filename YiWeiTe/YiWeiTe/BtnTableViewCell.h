//
//  BtnTableViewCell.h
//  YiWeiTe
//
//  Created by daiqile on 16/5/11.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageCenterButton+MyImageCenterButton.h"
#import "MyCostumButton.h"
@interface BtnTableViewCell : UITableViewCell
@property(nonatomic,strong)UIButton *menuBtn;
@property(nonatomic,strong)NSMutableArray *imgArray;
@property(nonatomic,strong)NSMutableArray *titleArray;
//@property(nonatomic,strong)ImageCenterButton *button;
@property(nonatomic,strong)MyCostumButton *button;
@end
