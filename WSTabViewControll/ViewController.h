//
//  ViewController.h
//  WSTabViewControll
//
//  Created by Dotsquares on 2/14/17.
//  Copyright © 2017 WebSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WSTabView.h"

@interface ViewController : UIViewController<WSTabViewDelegate>
{
    __weak IBOutlet WSTabView *wsTabView;
    __weak IBOutlet UILabel *lblResult;
}
@end

