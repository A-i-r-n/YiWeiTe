//
//  ReleaseGoodsViewController.h
//  YiWeiTe
//
//  Created by daiqile on 16/6/8.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReleaseGoodsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *titleLab;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)backClick:(id)sender;
- (IBAction)pullClick:(id)sender;
- (IBAction)releaseClick:(id)sender;

@end
