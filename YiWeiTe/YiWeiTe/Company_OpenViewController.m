//
//  Company_OpenViewController.m
//  YiWeiTe
//
//  Created by daiqile on 16/5/30.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "Company_OpenViewController.h"

@interface Company_OpenViewController ()<UIActionSheetDelegate,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate>

{
    NSInteger _selectIndex;
}

@end

@implementation Company_OpenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"企业开店";
    [self createNavigation];
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



- (IBAction)postPhoto:(id)sender
{
    UIButton *button = (UIButton *)sender;
    _selectIndex = button.tag;
    [self SetAvatar];
//    switch (button.tag) {
//        case 1:
//        {
//            NSLog(@"设置tag = 1 的图片");
//        }
//            break;
//        case 2:
//        {
//            NSLog(@"设置tag = 2 的图片");
//        }
//            break;
//        case 3:
//        {
//            NSLog(@"设置tag = 3 的图片");
//        }
//            break;
//        case 4:
//        {
//            NSLog(@"设置tag = 4 的图片");
//        }
//            break;
//        default:
//            break;
//    }
    
}

- (void)SetAvatar
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]                            initWithTitle:@"上传图片"delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"相册", nil];
    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {//拍照
        [self cameraClick];
    } else if (buttonIndex == 1) { // 相册
        [self photoClick];
    }
}

#pragma mark -调用相册
- (void)photoClick {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    NSArray *temp_MediaTypes = [UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
    picker.mediaTypes = temp_MediaTypes;
    picker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark --调用相机
- (void)cameraClick {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        NSString *requiredMediaType = ( NSString *)kUTTypeImage;
        NSArray *arrMediaTypes=[NSArray arrayWithObjects:requiredMediaType,nil];
        [picker setMediaTypes:arrMediaTypes];
        picker.showsCameraControls = YES;
        picker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        picker.editing = YES;
        picker.delegate = self;
        picker.allowsEditing = YES;
        [self presentViewController:picker animated:YES completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{

        UIButton *button = [self.bgView viewWithTag:_selectIndex];
        UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
        NSLog(@"%@",image);
        [button setBackgroundImage:image forState:UIControlStateNormal];
        //[button setBackgroundImage:[UIImage imageNamed:@"商品"] forState:UIControlStateNormal];
        //NSLog(@"photo.tag = %d",button.tag);

    [self viewDidAppear:YES];
    
}



@end
