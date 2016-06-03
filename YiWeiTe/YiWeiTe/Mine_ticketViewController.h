//
//  Mine_ticketViewController.h
//  YiWeiTe
//
//  Created by daiqile on 16/5/31.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Mine_ticketViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;


@property (strong, nonatomic) IBOutlet UIView *slide_View;

- (IBAction)backClick:(id)sender;

@end
