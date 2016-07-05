//
//  Detail_PromisView.m
//  YiWeiTe
//
//  Created by daiqile on 16/6/27.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Detail_PromisView.h"

@implementation Detail_PromisView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.font = [UIFont systemFontOfSize:16];
        _titleLab.text = @"服务说明";
        [self addSubview:_titleLab];
        
        _closeBtn = [[UIButton alloc]init];
        [_closeBtn setBackgroundImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        [self addSubview:_closeBtn];
        
        _ensureBtn = [[UIButton alloc]init];
        _ensureBtn.backgroundColor = [UIColor redColor];
        //_ensureBtn.layer.cornerRadius = 5;
        [_ensureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_ensureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self addSubview:_ensureBtn];
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [self addSubview:_tableView];
        
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(10);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_titleLab.mas_centerY);
        make.right.offset(-10);
        make.width.offset(25);
        make.height.offset(25);
    }];
    
    [_ensureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(ScreenHeight*0.65 - 45);
        //make.bottom.equalTo(self.mas_bottom).offset(-50);
        make.right.offset(0);
        make.left.offset(0);
        make.width.offset(ScreenWidth);
        make.height.offset(45);
    }];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLab.mas_bottom).offset(5);
        make.left.offset(0);
        make.right.offset(0);
        make.bottom.equalTo(_ensureBtn.mas_top);
    }];
}

#pragma mark tableViewDelegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 0.01;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 10;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.imageView.image = [UIImage imageNamed:@"close"];
    cell.textLabel.text = @"伊维特发货&售后服务";
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.detailTextLabel.text = @"由伊维特发货,没人提供售后服务";
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
    return cell;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
