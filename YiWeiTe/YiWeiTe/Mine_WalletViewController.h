//
//  Mine_WalletViewController.h
//  YiWeiTe
//
//  Created by daiqile on 16/5/17.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Mine_WalletViewController : UIViewController
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
- (IBAction)backBtn:(id)sender;
- (IBAction)balanceClick:(id)sender;
- (IBAction)bankCardClick:(id)sender;

@end
