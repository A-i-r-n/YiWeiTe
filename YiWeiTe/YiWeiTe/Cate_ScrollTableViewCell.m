
//
//  Cate_ScrollTableViewCell.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/26.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Cate_ScrollTableViewCell.h"

@implementation Cate_ScrollTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        _imgArray = [NSMutableArray arrayWithObjects:@"banner1",@"banner2",@"banner3", nil];
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, 140*ScreenWidth/375.0) imageURLStringsGroup:_imgArray];
        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        [self addSubview:cycleScrollView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
