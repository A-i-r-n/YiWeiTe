//
//  TestTableViewCell.h
//  YiWeiTe
//
//  Created by daiqile on 16/6/16.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestTableViewCell : UITableViewCell<DLTabedSlideViewDelegate>
@property (nonatomic,strong) DLTabedSlideView *tabedSlideView;
@end
