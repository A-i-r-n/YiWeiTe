//
//  FilterViewTool.m
//  BrokerWorkTool
//
//  Created by liujianzhong on 15/12/10.
//  Copyright © 2015年 liujianzhong. All rights reserved.
//

#import "FilterViewTool.h"
#import "ViewFilterSingle.h"
#import "ViewFilterDouble.h"

#define FILTERCONTENTHIGHT 266

@interface FilterViewTool () <ViewFilterSingleDelegate, ViewFilterDoubleDelegate>

@property (nonatomic, strong) ViewFilterSingle *viewFilterArea;
@property (nonatomic, strong) ViewFilterDouble *viewFilterDoubleBlock;
@property (nonatomic, strong) ViewFilterSingle *viewFilterPrice;
@property (nonatomic, strong) ViewFilterDouble *viewFilterMore;

@property (nonatomic, strong) UIButton *buttonBlock;
@property (nonatomic, strong) UIButton *buttonArea;
@property (nonatomic, strong) UIButton *buttonPrice;
@property (nonatomic, strong) UIButton *buttonMore;

@property (nonatomic, strong) UIView *viewLineF;
@property (nonatomic, strong) UIView *viewLineT;
@property (nonatomic, strong) UIView *viewLineR;

@property (nonatomic, strong) id localDoubleValue;
@property (nonatomic, strong) id localMoreValue;

@property (nonatomic, strong) id localAreaValue;
@property (nonatomic, strong) id localPriceValue;

@end

@implementation FilterViewTool
- (UIButton *)buttonBlock {
    if (_buttonBlock == nil) {
        _buttonBlock = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buttonBlock addTarget:self action:@selector(onClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _buttonBlock.selected = NO;
        _buttonBlock.tag = 1;
//        [_buttonBlock setBackgroundImage:[UIImage imageNamed:@"arrow_up"] forState:UIControlStateNormal];
        [_buttonBlock setTitleColor:DSColorFromHex(0x60646f) forState:UIControlStateNormal];
        [_buttonBlock setTitleColor:SELECT_TEXTCOLOR forState:UIControlStateSelected];
        [_buttonBlock setImageEdgeInsets:UIEdgeInsetsMake(11, 62, 11, 0)];
        [_buttonBlock setContentMode:UIViewContentModeScaleToFill];
        [_buttonBlock setBackgroundColor:[UIColor whiteColor]];
        _buttonBlock.titleLabel.font = [UIFont systemFontOfSize:14];
        _buttonBlock.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_buttonBlock addObserver:self forKeyPath:@"titleLabel.text" options:NSKeyValueObservingOptionNew context:nil];
        [_buttonBlock setImage:[UIImage imageNamed:@"arrow_down"] forState:UIControlStateNormal];
        [_buttonBlock setImage:[UIImage imageNamed:@"arrow_2_"] forState:UIControlStateSelected];
        [_buttonBlock setTitle:@"全部分类" forState:UIControlStateNormal];
    }
    return _buttonBlock ;
}

- (UIButton *)buttonArea {
    if (_buttonArea == nil) {
        _buttonArea = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buttonArea addTarget:self action:@selector(onClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _buttonArea.selected = NO;
        _buttonArea.tag = 2;
        [_buttonArea setBackgroundColor:[UIColor whiteColor]];
        [_buttonArea setTitleColor:DSColorFromHex(0x60646f) forState:UIControlStateNormal];
        [_buttonArea setTitleColor:SELECT_TEXTCOLOR forState:UIControlStateSelected];
        [_buttonArea setImageEdgeInsets:UIEdgeInsetsMake(11, 62, 11, 0)];
        [_buttonArea setContentMode:UIViewContentModeScaleToFill];
        _buttonArea.titleLabel.font = [UIFont systemFontOfSize:14];
        _buttonArea.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_buttonArea addObserver:self forKeyPath:@"titleLabel.text" options:NSKeyValueObservingOptionNew context:nil];
        [_buttonArea setImage:[UIImage imageNamed:@"arrow_down"] forState:UIControlStateNormal];
        [_buttonArea setImage:[UIImage imageNamed:@"arrow_2_"] forState:UIControlStateSelected];
        [_buttonArea setTitle:@"全城" forState:UIControlStateNormal];
    }
    return _buttonArea;
}

- (UIButton *)buttonPrice {
    if (_buttonPrice == nil) {
        _buttonPrice = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buttonPrice addTarget:self action:@selector(onClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _buttonPrice.selected = NO;
        _buttonPrice.tag = 3;
        [_buttonPrice setBackgroundColor:[UIColor whiteColor]];
        [_buttonPrice setTitleColor:DSColorFromHex(0x60646f) forState:UIControlStateNormal];
        [_buttonPrice setTitleColor:SELECT_TEXTCOLOR forState:UIControlStateSelected];
        [_buttonPrice setContentMode:UIViewContentModeScaleToFill];
        [_buttonPrice setImageEdgeInsets:UIEdgeInsetsMake(11, 62, 11, 0)];
        _buttonPrice.titleLabel.font = [UIFont systemFontOfSize:14];
        _buttonPrice.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_buttonPrice addObserver:self forKeyPath:@"titleLabel.text" options:NSKeyValueObservingOptionNew context:nil];
        [_buttonPrice setImage:[UIImage imageNamed:@"arrow_down"] forState:UIControlStateNormal];
        [_buttonPrice setImage:[UIImage imageNamed:@"arrow_2_"] forState:UIControlStateSelected];
        [_buttonPrice setTitle:@"筛选" forState:UIControlStateNormal];

    }
    return _buttonPrice;
}

- (ViewFilterSingle *)viewFilterArea {
    if (_viewFilterArea == nil) {
        _viewFilterArea = [[ViewFilterSingle alloc] init];
        _viewFilterArea.frame = CGRectMake(0, FilterViewToolHight, SCREENWIDTH, 0);
        _viewFilterArea.viewHight = FILTERCONTENTHIGHT;
        _viewFilterArea.arrayData = [NSMutableArray arrayWithObjects:@"测试1",@"测试2",@"测试3",@"测试4",@"测试5",@"测试6", nil];
        _viewFilterArea.delegate = self;
    }
    return _viewFilterArea;
}

- (ViewFilterSingle *)viewFilterPrice {
    if (_viewFilterPrice == nil) {
        _viewFilterPrice = [[ViewFilterSingle alloc] init];
        _viewFilterPrice.frame = CGRectMake(0, FilterViewToolHight, SCREENWIDTH, 0);
        _viewFilterPrice.viewHight = FILTERCONTENTHIGHT;
        _viewFilterPrice.arrayData = [NSMutableArray arrayWithObjects:@"测试1",@"测试2",@"测试3",@"测试4",@"测试5",@"测试6", nil];
        _viewFilterPrice.delegate = self;
    }
    return _viewFilterPrice;
}

- (ViewFilterDouble *)viewFilterMore {
    if (_viewFilterMore == nil) {
        _viewFilterMore = [[ViewFilterDouble alloc] init];
        _viewFilterMore.frame = CGRectMake(0, FilterViewToolHight, SCREENWIDTH, 0);
        _viewFilterMore.viewHight = FILTERCONTENTHIGHT;
        _viewFilterMore.arrayDataMain = [NSMutableArray arrayWithObjects:@"测试1",@"测试2",@"测试3",@"测试4",@"测试5",@"测试6", nil];
        _viewFilterMore.delegate = self;
    }
    return _viewFilterMore;
}

- (ViewFilterDouble *)viewFilterDoubleBlock {
    if (_viewFilterDoubleBlock == nil) {
        _viewFilterDoubleBlock = [[ViewFilterDouble alloc] init];
        _viewFilterDoubleBlock.delegate = self;
        _viewFilterDoubleBlock.frame = CGRectMake(0, FilterViewToolHight, SCREENWIDTH, 0);
        _viewFilterDoubleBlock.viewHight = FILTERCONTENTHIGHT;
    }
     _viewFilterDoubleBlock.arrayDataMain = [NSMutableArray arrayWithObjects:@"测试1",@"测试2",@"测试3",@"测试4",@"测试5",@"测试6", nil];
    return _viewFilterDoubleBlock;
}

- (UIView *)viewLineF {
    if (_viewLineF == nil) {
        _viewLineF = [[UIView alloc] init];
        _viewLineF.backgroundColor = DSGrayColor;
    }
    return _viewLineF;
}

- (UIView *)viewLineT {
    if (_viewLineT == nil) {
        _viewLineT = [[UIView alloc] init];
        _viewLineT.backgroundColor = DSGrayColor;
    }
    return _viewLineT;
}

- (UIView *)viewLineR {
    if (_viewLineR == nil) {
        _viewLineR = [[UIView alloc] init];
        _viewLineR.backgroundColor = DSLineSepratorColor;
    }
    return _viewLineR;
}

#pragma mark - lifeCycleMethods
- (id)init {
    if (self = [super init]) {
        [self initUI];
    }
    return self;
}

- (void)dealloc {
    [self.buttonBlock removeObserver:self forKeyPath:@"titleLabel.text"];
}

- (void)initUI {
    [self addSubview:self.viewFilterArea];
    [self addSubview:self.viewFilterDoubleBlock];
    [self addSubview:self.viewFilterPrice];
    [self addSubview:self.viewFilterMore];
    self.clipsToBounds = NO;
    self.buttonBlock.frame = CGRectMake(0, 0, SCREENWIDTH / 3, FilterViewToolHight);
    self.buttonArea.frame = CGRectMake(SCREENWIDTH / 3, 0, SCREENWIDTH / 3, FilterViewToolHight);
    self.buttonPrice.frame = CGRectMake(SCREENWIDTH/3 * 2, 0, SCREENWIDTH / 3, FilterViewToolHight);
    self.buttonMore.frame = CGRectMake(SCREENWIDTH / 3 * 3, 0, SCREENWIDTH / 3, FilterViewToolHight);
    
    self.viewLineF.frame = CGRectMake(self.buttonBlock.ctRight, 10, 1, FilterViewToolHight - 20);
    self.viewLineT.frame = CGRectMake(self.buttonArea.ctRight, 10, 1, FilterViewToolHight - 20);
    self.viewLineR.frame = CGRectMake(self.buttonPrice.ctRight, 10, 1, FilterViewToolHight - 20);
    
    [self addSubview:self.buttonBlock];
    [self addSubview:self.buttonArea];
    [self addSubview:self.buttonPrice];
    [self addSubview:self.buttonMore];
    [self addSubview:self.viewLineF];
    [self addSubview:self.viewLineT];
    [self addSubview:self.viewLineR];
    
    self.clipsToBounds = YES;
}

- (void)onClickButtonAction:(UIButton *)button {
    if (button.selected == YES) {
        [self cancelAllFilter];
        return;
    }
    [self cancelAllFilter];
    switch (button.tag) {
        case 1:
        {
            if (button.selected == NO) {
                    button.selected = YES;
                [self.viewFilterDoubleBlock show];
                if (self.localDoubleValue != nil) {
                    [self.viewFilterDoubleBlock setDefaultValue:self.localDoubleValue];
                }
            } else {
                button.selected = NO;
                [self.viewFilterDoubleBlock hidden];
            }
        }
            break;
        case 2:
        {
            if (button.selected == NO) {
                button.selected = YES;
                [self.viewFilterArea show];
                if (self.localAreaValue != nil) {
                    [self.viewFilterArea setDefaultValue:self.localAreaValue];
                }
            } else {
                button.selected = NO;
                [self.viewFilterArea hidden];
            }
            
        }
            break;
        case 3:
        {
            if (button.selected == NO) {
                button.selected = YES;
                [self.viewFilterPrice show];
                if (self.localMoreValue != nil) {
                    [self.viewFilterMore setDefaultValue:self.localMoreValue];
                }
            } else {
                button.selected = NO;
                [self.viewFilterPrice hidden];
            }
        }
            break;
        case 4:
        {
            if (button.selected == NO) {
                button.selected = YES;
                [self.viewFilterMore show];
                if (self.localMoreValue != nil) {
                    [self.viewFilterMore setDefaultValue:self.localMoreValue];
                }
            } else {
                button.selected = NO;
                [self.viewFilterMore hidden];
            }
        }
            break;
        default:
            break;
    }
    self.ctHeight = SCREENHEIGHT;
}

- (void)cancelAllFilter {
    self.buttonBlock.selected = NO;
    self.buttonArea.selected = NO;
    self.buttonPrice.selected = NO;
    self.buttonMore.selected = NO;
    
    [self.viewFilterDoubleBlock hidden];
    [self.viewFilterArea hidden];
    [self.viewFilterMore hidden];
    [self.viewFilterPrice hidden];
    self.ctHeight = FilterViewToolHight;

}

#pragma mark - ViewFilterSingleDelegate
- (void)didClickCancelAction:(id) filter {
    //cancel掉所有
    [self cancelAllFilter];
}

- (void)didSelectItem:(id)filter atIndex:(NSInteger)index withValue:(id)value {
    if ([filter isEqual:self.viewFilterArea]) {
        self.localAreaValue = value;
//        NSString *title = [self transationToShortString:value];
        [self resetButton:self.buttonArea SizeBy:value];
    }
    
    if ([filter isEqual:self.viewFilterPrice]) {
        self.localPriceValue = value;
//        NSString *title = [self transationToShortString:value];
        [self resetButton:self.buttonPrice SizeBy:value];
    }

    if ([filter isEqual:self.viewFilterDoubleBlock]) {
        self.localDoubleValue = value;
        NSString *title = [value[@"sub"] length] == 0? value[@"main"]:value[@"sub"];
        title = [self transationToShortString:title];
        [self resetButton:self.buttonBlock SizeBy:title];
    }
    
    if ([filter isEqual:self.viewFilterMore]) {
        self.localMoreValue = value;
        NSString *title = [value[@"sub"] length] == 0? value[@"main"]:value[@"sub"];
        title = [self transationToShortString:title];
        [self resetButton:self.buttonMore SizeBy:title];
    }
    [self cancelAllFilter];
    
}

- (NSString *)transationToShortString:(NSString *)string {
    NSString *stringResult = @"";
    if (string.length > 5) {
        stringResult = [NSString stringWithFormat:@"%@..",[string substringToIndex:4]];
    } else {
        stringResult = string;
    }
    return stringResult;
}

-(void)resetButton:(UIButton *)button SizeBy:(NSString*)str{
    [button setTitle:str forState:UIControlStateNormal];
}

#pragma mark - ********************************** Notification *****************************************
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    UIButton *btnChange = (UIButton *)object;
    /// 计算当前按钮文字的宽度
    NSString *strNew = change[@"new"];
    /// 得到文字和图片的大小
    //CGSize sizeNewString = [strNew sizeWithFont:btnChange.titleLabel.font];
    CGSize sizeNewString = [strNew sizeWithAttributes:@{NSFontAttributeName:btnChange.titleLabel.font}];
    CGSize sizeImage = btnChange.imageView.frame.size;
    /// 设置图片和文字
    [btnChange setTitleEdgeInsets:UIEdgeInsetsMake(0, -sizeImage.width + 5, 0, sizeImage.width+5)];
    [btnChange setImageEdgeInsets:UIEdgeInsetsMake(0, sizeNewString.width, 0, -sizeNewString.width - 5)];
}

@end
