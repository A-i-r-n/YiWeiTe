//
//  Mine_OpenshopViewController.h
//  YiWeiTe
//
//  Created by daiqile on 16/5/17.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Mine_OpenshopViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *personImg;
- (IBAction)personBtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *companyImg;
- (IBAction)companyBtn:(id)sender;

@end
