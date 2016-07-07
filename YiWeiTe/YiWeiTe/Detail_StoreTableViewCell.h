//
//  Detail_StoreTableViewCell.h
//  YiWeiTe
//
//  Created by daiqile on 16/6/20.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Detail_StoreTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *logo;
@property (strong, nonatomic) IBOutlet UILabel *sName;
@property (strong, nonatomic) IBOutlet UIImageView *star;
@property (strong, nonatomic) IBOutlet UILabel *actionNum;
@property (strong, nonatomic) IBOutlet UILabel *allGoods;
@property (strong, nonatomic) IBOutlet UILabel *state;
@property (strong, nonatomic) IBOutlet UIButton *connectBtn;
@property (strong, nonatomic) IBOutlet UIButton *storeBtn;

@end
