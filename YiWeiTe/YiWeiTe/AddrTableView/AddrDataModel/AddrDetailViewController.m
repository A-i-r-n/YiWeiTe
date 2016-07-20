//
//  AddrDetailViewController.m
//  ZKAddrList
//
//  Created by 陈婷 on 16/4/13.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "AddrDetailViewController.h"
#import "AreaPickerCover.h"
@interface AddrDetailViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,AreaPickerCoverDelegate>
@property (strong, nonatomic) IBOutlet UITableView *userAddrTableView;
//@property (weak, nonatomic) IBOutlet UITableView *userAddrTableView;
@property (nonatomic,copy) NSString* navTitle;
@property (nonatomic,strong) AddrDataModel* dataModel;
@property (nonatomic,strong) NSString *areaStr;
@property (nonatomic,strong) NSIndexPath *selectIndexPath;
@end

@implementation AddrDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [self setUpSubView];
}

-(void)setUpSubView{
    //设置nav标题
    self.navigationItem.title = self.navTitle;
    //tableview代理
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.userAddrTableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0.1)];
    self.userAddrTableView.delegate = self;
    self.userAddrTableView.dataSource = self;
}

-(void)setUpViewContent:(AddrDataModel*)dataModel{
    if (!dataModel) {
        self.dataModel = [[AddrDataModel alloc]init];
        self.navTitle = @"新建联系人";
    }else{
        self.dataModel = dataModel;
        self.navTitle = @"编辑联系人";
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - 实现textfield的代理
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField) {
        [textField resignFirstResponder];
    }
    return TRUE;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if ([textField.placeholder  isEqualToString: @"姓名"]) {
        self.dataModel.name = textField.text;
    }else if([textField.placeholder  isEqualToString: @"电话号码"]){
        self.dataModel.telphone = textField.text;
    }else if([textField.placeholder isEqualToString:@"街道、楼牌号等"]){
        self.dataModel.detailAddr = textField.text;
    }
    return TRUE;
}

#pragma mark - 实现tableview的相关代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* sLblLblCellStr = @"LblLblTableViewCell";
    static NSString* sLblTxtCellStr = @"LblTxtTableViewCell";
    UITableViewCell* cell = nil;
    if (indexPath.row != 2) {
        cell = [tableView dequeueReusableCellWithIdentifier:sLblTxtCellStr];
        if (!cell) {
            UINib *nib= [UINib nibWithNibName:sLblTxtCellStr bundle:nil];
            [tableView registerNib:nib forCellReuseIdentifier:sLblTxtCellStr];
            cell = [tableView dequeueReusableCellWithIdentifier:sLblTxtCellStr];
        }
        UILabel* lbl = [cell viewWithTag:1];
        UITextField* txtField = [cell viewWithTag:2];
        txtField.returnKeyType = UIReturnKeyDone;
        txtField.delegate = self;
        if (indexPath.row == 0) {
            lbl.text = @"收件人:";
            txtField.placeholder = @"姓名";
            txtField.text = self.dataModel.name;
        }else if (indexPath.row == 1){
            lbl.text = @"联系方式:";
            txtField.placeholder = @"电话号码";
            txtField.text = self.dataModel.telphone;
        }else{
            lbl.text = @"详细地址:";
            txtField.placeholder = @"街道、楼牌号等";
            txtField.text = self.dataModel.detailAddr;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:sLblLblCellStr];
        if (!cell) {
            UINib *nib= [UINib nibWithNibName:sLblLblCellStr bundle:nil];
            [tableView registerNib:nib forCellReuseIdentifier:sLblLblCellStr];
            cell = [tableView dequeueReusableCellWithIdentifier:sLblLblCellStr];

        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UILabel* lbl_1 = [cell viewWithTag:1];
        UILabel* lbl_2 = [cell viewWithTag:2];
        lbl_1.text = @"所在地区:";
        lbl_2.text = self.dataModel.areaStr;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
        AreaPickerCover *view = [[AreaPickerCover alloc] init];
        view.delegate = self;
        _selectIndexPath = indexPath;
        [view show];

    }
}

#pragma mark AreaPickerCoverDelegate

- (void)getAreaInformationProvince:(NSString *)province City:(NSString *)city District:(NSString *)district{
//    NSLog(@"province = %@, city = %@, district = %@",province,city,district);
    self.dataModel.areaStr = [NSString stringWithFormat:@"%@ %@ %@",province,city,district];
    _areaStr = [NSString stringWithFormat:@"%@ %@ %@",province,city,district];
    UITableViewCell *cell = (UITableViewCell *)[self.userAddrTableView cellForRowAtIndexPath:self.selectIndexPath];
    UILabel* lbl_2 = [cell viewWithTag:2];
    lbl_2.text = _areaStr;
}

#pragma mark - 响应控件
- (IBAction)SaveAddr:(UIButton *)sender {
    if (self.dataModel.name&&
        self.dataModel.telphone&&
        self.dataModel.detailAddr&&
        self.dataModel.areaStr) {
        if (self.delegate) {
            [self.delegate fetchNewAddr:self.dataModel];
        }
        
        [self.navigationController popViewControllerAnimated:TRUE];
        
    }else{
        //提示输入完整信息
        [self showAlertViewWithTitle:@"提示信息" withMessage:@"信息不完整,请补充完整" withActionTitle:@"取消"];
    }
}

- (void)showAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message withActionTitle:(NSString *)actionTitle
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* action = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:TRUE completion:nil];
}

@end
