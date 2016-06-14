//
//  NewNoticeView.h
//  TwiceKaiJiang
//
//  Created by yyj on 16/2/2.
//  Copyright © 2016年 gxm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewNoticeView : UIView

@property (nonatomic ,strong) UILabel *notice;
@property (nonatomic ,strong) UILabel *award;

@property (nonatomic ,strong) NSMutableArray *noticeList;
@property (nonatomic ,strong) NSMutableArray *awardList;
@end
