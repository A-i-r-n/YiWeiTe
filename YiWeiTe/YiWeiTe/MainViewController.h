//
//  MainViewController.h
//  YiWeiTe
//
//  Created by daiqile on 16/5/10.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLCustomSlideView.h"
#import "SearchBarView.h"
#import "SDCycleScrollView.h"

@interface MainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,DLTabedSlideViewDelegate,SearchBarViewDelegate,SDCycleScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) DLTabedSlideView *tabedSlideView;
@end
