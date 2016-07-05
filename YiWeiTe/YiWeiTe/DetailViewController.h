//
//  DetailViewController.h
//  YiWeiTe
//
//  Created by daiqile on 16/6/15.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXActionSheet.h"
#import "MyCostumButton.h"

@interface DetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) QXActionSheet *ActionSheet;
@property (strong, nonatomic) IBOutlet MyCostumButton *connectBtn;//联系卖家
@property (strong, nonatomic) IBOutlet MyCostumButton *storeBtn;//店铺
@property (strong, nonatomic) IBOutlet MyCostumButton *careBtn;//关注
@property (strong, nonatomic) IBOutlet MyCostumButton *cartBtn;//购物车

@end
