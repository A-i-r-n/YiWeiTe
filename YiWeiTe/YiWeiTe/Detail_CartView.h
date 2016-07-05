//
//  Detail_CartView.h
//  YiWeiTe
//
//  Created by daiqile on 16/6/29.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCostumButton.h"
#import "MessageButton.h"

@interface Detail_CartView : UIView

@property (strong, nonatomic) MessageButton *connectBtn;//联系卖家
@property (strong, nonatomic) MessageButton *storeBtn;//店铺
@property (strong, nonatomic) MessageButton *careBtn;//关注
@property (strong, nonatomic) MessageButton *cartBtn;//购物车

@property(nonatomic,strong)UIButton *addCartBtn;//加入购物车

@end
