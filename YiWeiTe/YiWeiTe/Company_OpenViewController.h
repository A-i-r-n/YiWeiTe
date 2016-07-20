//
//  Company_OpenViewController.h
//  YiWeiTe
//
//  Created by daiqile on 16/5/30.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Company_OpenViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *sendPhoto;
@property (strong, nonatomic) IBOutlet UIView *bgView;


- (IBAction)postPhoto:(id)sender;

@end
