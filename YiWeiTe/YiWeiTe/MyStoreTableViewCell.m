
//
//  MyStoreTableViewCell.m
//  YiWeiTe
//
//  Created by daiqile on 16/6/6.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "MyStoreTableViewCell.h"

@implementation MyStoreTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//加关注
- (IBAction)attentionClick:(id)sender
{
    NSLog(@"关注");
}

//全部新品
- (IBAction)allNewClick:(id)sender
{
    NSLog(@"全部新品");
}

//上新
- (IBAction)newClick:(id)sender
{
    NSLog(@"上新");
}

//促销
- (IBAction)salesClick:(id)sender
{
    NSLog(@"促销");
}


//店铺动态
- (IBAction)storeClick:(id)sender
{
    NSLog(@"店铺动态");
}
@end
