//
//  Menubar.m
//
//
//  Created by Terence on 15/10/19.
//  Copyright © 2015年 MT. All rights reserved.
//

#import "Menubar.h"
//#import "CategoryManager.h"

@implementation Menubar
{
    UIScrollView* m_scroll;
    UIButton* m_arrow;
    UIView* m_slider;
    UIView* m_hint;
    
    NSMutableArray* m_sliderlist;
    NSMutableArray* m_btnlist;
    long alllen;
    int alline;
    BOOL isUp;
}

+ (instancetype) menuWithView:(UIView*) view
{
    Menubar* menu = [Menubar new];
    menu.selectedIndex = -1;
    menu.bar = view;
    menu.width = ScreenWidth;
    menu.height = view.frame.size.height;
    return menu;
}

- (instancetype) init
{
    if(self = [super init]){
        m_hint = [UIView new];
        m_hint.backgroundColor = [UIColor colorWithRed:164/255.0 green:0 blue:0 alpha:1];
    }
    return self;
}

- (void) dispose
{
    [m_scroll removeFromSuperview];
    for(int i=0; i<m_btnlist.count; i++){
        UIButton* btn = m_btnlist[i];
        [btn removeFromSuperview];
        [btn removeTarget:self action:@selector(onTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    [m_btnlist removeAllObjects];
    for(int i=0; i<m_sliderlist.count; i++){
        UIButton* btn = m_sliderlist[i];
        [btn removeFromSuperview];
        [btn removeTarget:self action:@selector(onTouchAbn:) forControlEvents:UIControlEventTouchUpInside];
    }
    [m_arrow removeFromSuperview];
    [m_arrow removeTarget:self action:@selector(onTouchArrow) forControlEvents:UIControlEventTouchUpInside];
    
    [m_slider removeFromSuperview];
}

- (void) setup
{
    isUp = YES;
    m_btnlist = [NSMutableArray new];
    m_scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bar.frame.size.width, self.bar.frame.size.height)];
    m_scroll.showsHorizontalScrollIndicator = NO;
    m_scroll.showsVerticalScrollIndicator = NO;
    [self.bar addSubview:m_scroll];
    
    m_sliderlist = [NSMutableArray new];
    m_arrow = [[UIButton alloc] initWithFrame:CGRectMake(self.width-self.height*1.5, 0+20/2, self.height*1.5, self.height-20)];
    [m_arrow addTarget:self action:@selector(onTouchArrow) forControlEvents:UIControlEventTouchUpInside];
    [m_arrow setImage:[UIImage imageNamed:@"arrow_down"] forState:UIControlStateNormal];
    //m_arrow.backgroundColor = [UIColor redColor];
    [m_arrow setContentMode:UIViewContentModeCenter];
    m_arrow.hidden = YES;
    [self.bar addSubview:m_arrow];
    
    m_slider = [UIView new];
    m_slider.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    m_slider.frame = CGRectMake(0, 0, 0, 0);
    m_slider.clipsToBounds = YES;
    [self.bar.superview addSubview:m_slider];
    
    [m_scroll addSubview:m_hint];
}




- (void) setDatalist:(NSArray *)datalist
{
    [self dispose];
    [self setup];
    _datalist = datalist;
    
    [m_btnlist removeAllObjects];
    [m_sliderlist removeAllObjects];
    alllen= 0;
    alline = 0;
    int this_line_len = 0;
    for(int i=0; i<datalist.count; i++){

        NSString *title = datalist[i];

        long curlen = 80;//title.length*10+30;
        
        //bar
        UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(alllen, 0, curlen, self.height)];
        [btn setTitle:title forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [btn addTarget:self action:@selector(onTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
        [m_scroll addSubview:btn];
        [m_btnlist addObject:btn];
        
        //arrow
        UIButton* abn = [UIButton new];
        [abn setTitle:title forState:UIControlStateNormal];
        abn.titleLabel.font = [UIFont systemFontOfSize:13];
        [abn addTarget:self action:@selector(onTouchAbn:) forControlEvents:UIControlEventTouchUpInside];
        if(i==0){
            alline = 0;
        }else{
            UIButton* lastbtn = m_sliderlist[i-1];
            this_line_len = lastbtn.frame.origin.x + lastbtn.frame.size.width;
            if((this_line_len+curlen)>self.width) {
                alline++;
                this_line_len = 0;
            }else{
                //
            }
        }
        abn.frame = CGRectMake(this_line_len, alline*self.height, curlen, self.height);
        this_line_len+=curlen;
        [m_slider addSubview:abn];
        [m_sliderlist addObject:abn];
        
        alllen+= curlen;
    }
    
    if(alllen>self.width){
        m_scroll.frame = CGRectMake(0, 0, self.width-self.height*1.5, self.height);
        [m_scroll setContentSize:CGSizeMake(alllen, self.height)];
        m_arrow.hidden = NO;
    }
//    UIButton* curbtn = m_btnlist[0];
//    if(curbtn) [self setSelected:curbtn Trigger:YES];

}

- (void) onTouchArrow
{
    if(isUp) [self setArrowDown];
    else [self setArrowUp];
}

- (void) setArrowUp
{
    isUp = YES;
    [UIView animateWithDuration:0.2 animations:^{
        m_arrow.transform = CGAffineTransformMakeRotation(0);
        m_slider.frame = CGRectMake(0,64 + self.height, self.width, 0);
    }];
}

- (void) setArrowDown
{
    isUp = NO;
    [UIView animateWithDuration:0.2 animations:^{
        m_arrow.transform = CGAffineTransformMakeRotation(M_PI);
        m_slider.frame = CGRectMake(0, 64 + self.height, self.width, self.height*(alline+1));
        
        NSLog(@"%d", self.width);
    }];
}

- (void) onTouchAbn:(UIButton*) btn
{
    NSInteger index = [m_sliderlist indexOfObject:btn];
    [self setSelected:m_btnlist[index] Trigger:YES];
}

- (void) onTouchBtn:(UIButton*) btn
{
    [self setSelected:btn Trigger:YES];
}

- (void) setSelected:(UIButton*) btn Trigger:(BOOL) bol
{
    [self setArrowUp];
    
    for(int i=0; i<m_btnlist.count; i++){
        UIButton* curbtn = m_btnlist[i];
        if(curbtn==btn){
            curbtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
            [curbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }else{
            curbtn.titleLabel.font = [UIFont systemFontOfSize:13];
            [curbtn setTitleColor:[UIColor colorWithWhite:1 alpha:0.8] forState:UIControlStateNormal];
        }
    }
    if(btn){
        CGFloat x = btn.frame.origin.x;
        CGFloat wid = btn.frame.size.width;
        CGFloat left = x - (m_scroll.frame.size.width-wid)/2;
        if(left < 0) left = 0;
        if(left > (alllen-m_scroll.frame.size.width)) left = (alllen-m_scroll.frame.size.width);
        [m_scroll setContentOffset:CGPointMake(left, 0) animated:YES];
        
        /////
        
        CGRect fr = btn.frame;
        fr.origin.y = self.bar.frame.size.height -3;
        fr.size.height = 3;
        m_hint.frame = fr;
        
    }
    NSInteger newindex = [m_btnlist indexOfObject:btn];
    if(newindex>=0 && newindex<m_btnlist.count){
        if(self.delegate && newindex!=self.selectedIndex && bol ) [self.delegate onMenuChanged:newindex];
        self.selectedIndex=newindex;
    }else{
        NSLog(@"选择菜单出了问题:@%ld",newindex);
    }
}

- (void) setSelectedIndex:(NSInteger)indx Trigger:(BOOL) bol
{
    [self setSelected:m_btnlist[indx] Trigger:bol];
}

- (void) setWidth:(int)width
{
    _width = width;
    [self setDatalist:self.datalist];
}

- (void) setHeight:(int)height
{
    _height = height;
//    CGRect rect = m_scroll.frame;
//    rect.size.width = _height;
//    m_scroll.frame = rect;
}



@end
