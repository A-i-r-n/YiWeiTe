//
//  Store_ViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/7/7.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Store_ViewController.h"
#import "MultilevelMenu.h"
#import "StoreView.h"
@interface Store_ViewController ()

@end

@implementation Store_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createMultileveMenu];
    [self createNavigation];
    self.navigationItem.title = @"店铺";
}
- (void)createNavigation
{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}

//返回
- (void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)createMultileveMenu
{
    
    StoreView *sView = [[StoreView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, 100)];
    [sView.sDetail addTarget:self action:@selector(detailClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sView];
    
    NSMutableArray * lis=[NSMutableArray arrayWithCapacity:0];
    
    
    /**
     *  构建需要数据 2层或者3层数据 (ps 2层也当作3层来处理)
     */
    NSInteger countMax=6;
    for (int i=0; i<countMax; i++) {
        
        rightMeun * meun=[[rightMeun alloc] init];
        meun.meunName=[NSString stringWithFormat:@"菜单%d",i];
        NSMutableArray * sub=[NSMutableArray arrayWithCapacity:0];
        for ( int j=0; j <countMax+1; j++) {
            
            rightMeun * meun1=[[rightMeun alloc] init];
            meun1.meunName=[NSString stringWithFormat:@"%d头菜单%d",i,j];
            
            [sub addObject:meun1];
            
            //meun.meunNumber=2;
            
            NSMutableArray *zList=[NSMutableArray arrayWithCapacity:0];
            if (j%2==0) {
                
                for ( int z=0; z <countMax+2; z++) {
                    
                    rightMeun * meun2=[[rightMeun alloc] init];
                    meun2.meunName=[NSString stringWithFormat:@"%d层菜单%d",j,z];
                    
                    [zList addObject:meun2];
                    
                }
            }
            
            meun1.nextArray=zList;
        }
        
        
        meun.nextArray=sub;
        [lis addObject:meun];
    }
    
    /**
     *  适配 ios 7 和ios 8 的 坐标系问题
     */
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    /**
     默认是 选中第一行
     
     :returns: <#return value description#>
     */
    MultilevelMenu * view=[[MultilevelMenu alloc] initWithFrame:CGRectMake(0, 164, ScreenWidth, ScreenHeight-164) WithData:lis withSelectIndex:^(NSInteger left, NSInteger right,rightMeun* info) {
        
        NSLog(@"点击的 菜单%@",info.meunName);
    }];
    
    
    view.needToScorllerIndex=0;
    
    view.isRecordLastScroll=YES;
    [self.view addSubview:view];

}

- (void)detailClick
{
    NSLog(@"店铺详情");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
