//
//  TestTableViewCell.m
//  YiWeiTe
//
//  Created by daiqile on 16/6/16.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "TestTableViewCell.h"
#import "NearbyViewController.h"
#import "NationwideViewController.h"
#import "LikeViewController.h"
#import "TrackViewController.h"

@implementation TestTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.tabedSlideView = [[DLTabedSlideView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 500)];
        self.tabedSlideView.delegate=self;
        //self.tabedSlideView.baseViewController = self;
        self.tabedSlideView.tabItemNormalColor = [UIColor blackColor];
        self.tabedSlideView.tabItemSelectedColor = SELECT_TEXTCOLOR;
        self.tabedSlideView.tabbarTrackColor = SELECT_TEXTCOLOR;
        //self.tabedSlideView.tabbarBackgroundImage = [UIImage imageNamed:@"tabbarBk"];
        self.tabedSlideView.tabbarBottomSpacing = 3.0;
        DLTabedbarItem *item1 = [DLTabedbarItem itemWithTitle:@"附近商家" image:[UIImage imageNamed:@"arrow_down"] selectedImage:[UIImage imageNamed:@"arrow_up"]];
        DLTabedbarItem *item2 = [DLTabedbarItem itemWithTitle:@"全国商家" image:[UIImage imageNamed:@"arrow_down"] selectedImage:[UIImage imageNamed:@"arrow_up"]];
        DLTabedbarItem *item3 = [DLTabedbarItem itemWithTitle:@"猜你喜欢" image:[UIImage imageNamed:@"arrow_down"] selectedImage:[UIImage imageNamed:@"arrow_up"]];
        DLTabedbarItem *item4 = [DLTabedbarItem itemWithTitle:@"足迹" image:[UIImage imageNamed:@"arrow_down"] selectedImage:[UIImage imageNamed:@"arrow_up"]];
        self.tabedSlideView.tabbarItems = @[item1, item2, item3,item4];
        [self.tabedSlideView buildTabbar];
        
        self.tabedSlideView.selectedIndex = 0;
        [self addSubview:_tabedSlideView];
        
    }
    return self;
}

#pragma  mark  DLSlicdeView Delegate

- (NSInteger)numberOfTabsInDLTabedSlideView:(DLTabedSlideView *)sender{
    return self.tabedSlideView.tabbarItems.count;
}
- (UIViewController *)DLTabedSlideView:(DLTabedSlideView *)sender controllerAt:(NSInteger)index{
    switch (index) {
        case 0:
        {
            NearbyViewController *nearby = [[NearbyViewController alloc]init];
            return nearby;
        }
        case 1:
        {
            NationwideViewController *nationWide = [[NationwideViewController alloc]init];
            return nationWide;
        }
        case 2:
        {
            LikeViewController *like = [[LikeViewController alloc]init];
            return like;
        }
        case 3:
        {
            TrackViewController *track = [[TrackViewController alloc]init];
            return track;
        }
            
        default:
            return nil;
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
