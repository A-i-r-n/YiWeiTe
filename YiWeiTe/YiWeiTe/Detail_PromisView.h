//
//  Detail_PromisView.h
//  YiWeiTe
//
//  Created by daiqile on 16/6/27.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Detail_PromisView : UIView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UIButton *closeBtn;
@property(nonatomic,strong)UIButton *ensureBtn;
@property(nonatomic,strong)UITableView *tableView;
@end
