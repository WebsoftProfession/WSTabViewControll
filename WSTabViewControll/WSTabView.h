//
//  WSTabView.h
//  WSTabViewControll
//
//  Created by Dotsquares on 2/14/17.
//  Copyright © 2017 WebSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WSTabButton.h"

@protocol WSTabViewDelegate <NSObject>
-(NSString *)titlesForTabButtons:(int)index;
-(NSInteger)numberOfButtonsInTabView;
-(void)didSelectTabButtonAtIndex:(int)index;
@end
@interface WSTabView : UIView
{
    UIScrollView *scrollView;
    WSTabButton *currentButton;
}

@property (nonatomic,strong) id<WSTabViewDelegate> delegate;
@property (assign) int selectedTabButton;
@property (nonatomic,strong) UIColor *activeBackcroundColor;
@property (nonatomic,strong) UIColor *inActiveBackgroundColor;
@property (nonatomic,strong) UIColor *activeTitleColor;
@property (nonatomic,strong) UIColor *inActiveTitleColor;
@property (nonatomic,strong) UIFont *tabFont;

-(void)setupTabView;

@end
