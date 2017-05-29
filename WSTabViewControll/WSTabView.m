//
//  WSTabView.m
//  WSTabViewControll
//
//  Created by Dotsquares on 2/14/17.
//  Copyright © 2017 WebSoft. All rights reserved.
//

#import "WSTabView.h"

@implementation WSTabView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/




-(void)setupTabView{
    CGRect currentButtonFrame;
    if (!scrollView) {
        scrollView=[[UIScrollView alloc] init];
        scrollView.backgroundColor=[UIColor clearColor];
        scrollView.showsHorizontalScrollIndicator=NO;
        [self addSubview:scrollView];
        scrollView.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    }
    else
    {
        [[scrollView subviews]makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    NSInteger count = [self.delegate numberOfButtonsInTabView];
    for (int i=0; i<count; i++) {
        WSTabButton *btn=[WSTabButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(i*100+i*10+(10), 3.5, 100, 30);
        btn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        if (self.tabFont) {
            [btn.titleLabel setFont:self.tabFont];
        }
        else
        {
            [btn.titleLabel setFont:[UIFont fontWithName:@"Arial" size:10]];
        }
        
        if (self.inActiveTitleColor) {
            [btn setTitleColor:self.inActiveTitleColor forState:UIControlStateNormal];
        }
        else
        {
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
        
        if (self.inActiveBackgroundColor) {
            [btn setBackgroundColor:self.inActiveBackgroundColor];
        }
        else
        {
            [btn setBackgroundColor:[UIColor whiteColor]];
        }
        
        [btn setTitle:[self.delegate titlesForTabButtons:i] forState:UIControlStateNormal];
        
        
        [scrollView addSubview:btn];
        UIView *bottomLine=[[UIView alloc] initWithFrame:CGRectMake(btn.frame.origin.x, btn.frame.origin.y+btn.frame.size.height, btn.frame.size.width, 3)];
        bottomLine.backgroundColor=[UIColor clearColor];
        //[topScrollView addSubview:bottomLine];
        
        btn.index = i;
        [btn addTarget:self action:@selector(btnAciton:) forControlEvents:UIControlEventTouchUpInside];
        if (!currentButton) {
            btn.isActive=YES;
            currentButtonFrame=btn.frame;
            currentButton=btn;
            [self.delegate didSelectTabButtonAtIndex:i];
        }
        else
        {
            if (currentButton.index==i) {
                btn.isActive=YES;
                currentButtonFrame=btn.frame;
                currentButton=btn;
                [self.delegate didSelectTabButtonAtIndex:i];
            }
        }
        
        if (btn.isActive) {
            if (self.activeTitleColor) {
                [btn setTitleColor:self.activeTitleColor forState:UIControlStateNormal];
            }
            else
            {
                [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            }
            
            if (self.activeBackcroundColor) {
                btn.backgroundColor=self.activeBackcroundColor;
            }
            else
            {
                btn.backgroundColor=[UIColor redColor];
            }
            
            
        }
        if (count-1==i) {
            scrollView.contentSize=CGSizeMake(btn.frame.origin.x+btn.frame.size.width+10, self.frame.size.height);
            [scrollView scrollRectToVisible:CGRectMake(currentButtonFrame.origin.x, currentButtonFrame.origin.y, currentButtonFrame.size.width+10, currentButtonFrame.size.height) animated:YES];
        }
    }
}

-(void)btnAciton:(WSTabButton *)btn
{
    btn.isActive=YES;
    currentButton=btn;
    [self setupTabView];
    [self.delegate didSelectTabButtonAtIndex:btn.index];
}

@end
