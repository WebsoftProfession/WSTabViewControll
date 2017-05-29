//
//  ViewController.m
//  WSTabViewControll
//
//  Created by Dotsquares on 2/14/17.
//  Copyright © 2017 WebSoft. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *tabArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    tabArray = @[@"Cricket",@"Football",@"Hockey",@"Basball"];
    wsTabView.delegate = self;
    //wsTabView.activeBackcroundColor = [UIColor greenColor];
    //wsTabView.activeTitleColor = [UIColor redColor];
    //wsTabView.inActiveBackgroundColor = [UIColor greenColor];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    [wsTabView setupTabView];
}

#pragma mark - WSTabView Delegate & Datasource Methods

-(NSInteger)numberOfButtonsInTabView
{
    return tabArray.count;
}

-(NSString *)titlesForTabButtons:(int)index
{
    return [tabArray objectAtIndex:index];
}

-(void)didSelectTabButtonAtIndex:(int)index
{
    lblResult.text=[tabArray objectAtIndex:index];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
