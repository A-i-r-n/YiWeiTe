//
//  MyStoreTableViewCell.h
//  YiWeiTe
//
//  Created by daiqile on 16/6/6.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyStoreTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *logoImg;//商标logo
@property (strong, nonatomic) IBOutlet UILabel *storeNameLab;//店铺名
@property (strong, nonatomic) IBOutlet UILabel *attentionLab;//关注人数

@property (strong, nonatomic) IBOutlet UILabel *allnewNum;//全部新品数
@property (strong, nonatomic) IBOutlet UILabel *allnumLab;//全部新品

@property (strong, nonatomic) IBOutlet UILabel *numNew;//上新数
@property (strong, nonatomic) IBOutlet UILabel *labNew;


//上新

@property (strong, nonatomic) IBOutlet UILabel *salesNum;//促销数
@property (strong, nonatomic) IBOutlet UILabel *salesLab;//促销

@property (strong, nonatomic) IBOutlet UILabel *storeNum;//店铺动态数
@property (strong, nonatomic) IBOutlet UILabel *storeLab;//店铺动态

- (IBAction)attentionClick:(id)sender;//关注
- (IBAction)allNewClick:(id)sender;//全部新品
- (IBAction)newClick:(id)sender;//上新
- (IBAction)salesClick:(id)sender;//促销
- (IBAction)storeClick:(id)sender;//店铺动态


@end
