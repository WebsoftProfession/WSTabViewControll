//
//  WSTabButton.h
//  WSTabViewControll
//
//  Created by Dotsquares on 2/14/17.
//  Copyright © 2017 WebSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSTabButton : UIButton

@property (nonatomic, strong) NSNumber *tagID;
@property (assign) BOOL isActive;
@property (assign) int index;
@property (nonatomic, strong) NSMutableDictionary *linkedData;

@end
