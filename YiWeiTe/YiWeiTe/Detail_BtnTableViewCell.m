//
//  Detail_BtnTableViewCell.m
//  YiWeiTe
//
//  Created by daiqile on 16/6/20.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Detail_BtnTableViewCell.h"
#import "HMSegmentedControl.h"
@implementation Detail_BtnTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"商品介绍", @"规格参数", @"包装售后"]];
        segmentedControl.frame = CGRectMake(0, 7, self.frame.size.width, 30);
        segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
        segmentedControl.selectedSegmentIndex = _SelectedIndex;
        segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
        segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : SELECT_TEXTCOLOR};
        segmentedControl.selectionIndicatorColor = [UIColor clearColor];
        //segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleBox;
        
        [segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:segmentedControl];

    }
    return self;
}

//分类
- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"选中%ld", (long)segmentedControl.selectedSegmentIndex);
    _SelectedIndex = segmentedControl.selectedSegmentIndex;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
