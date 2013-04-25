//
//  SideRightMenuViewController.m
//  ECSlidingViewController
//
//  Created by Meng To on 4/23/13.
//
//

#import "SideRightMenuViewController.h"
#import "ECSlidingViewController.h"

@interface SideRightMenuViewController ()

@end

@implementation SideRightMenuViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"self.sliding = %@",self.slidingViewController);
    
//
    [self.slidingViewController setAnchorLeftPeekAmount:58];
    self.slidingViewController.underRightWidthLayout = ECFullWidth;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"SideRight vie wiwll appear");
    [super viewWillAppear:animated];
    [self.slidingViewController setAnchorLeftPeekAmount:58];
    self.slidingViewController.underRightWidthLayout = ECFullWidth;
    
}

@end
