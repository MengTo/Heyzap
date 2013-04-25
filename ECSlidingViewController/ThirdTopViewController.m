//
//  ThirdTopViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "ThirdTopViewController.h"

@implementation ThirdTopViewController

- (void)awakeFromNib
{
  [[NSNotificationCenter defaultCenter] addObserver:self 
                                           selector:@selector(underLeftWillAppear:)
                                               name:ECSlidingViewUnderLeftWillAppear 
                                             object:self.slidingViewController];
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(topDidAnchorRight:) 
                                               name:ECSlidingViewTopDidAnchorRight 
                                             object:self.slidingViewController];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(underRightWillAppear:) 
                                               name:ECSlidingViewUnderRightWillAppear 
                                             object:self.slidingViewController];
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(topDidAnchorLeft:) 
                                               name:ECSlidingViewTopDidAnchorLeft 
                                             object:self.slidingViewController];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(topDidReset:) 
                                               name:ECSlidingViewTopDidReset 
                                             object:self.slidingViewController];
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
    
    // shadowPath, shadowOffset, and rotation is handled by ECSlidingViewController.
    // You just need to set the opacity, radius, and color.
    self.view.layer.shadowOpacity = 0.5f;
    self.view.layer.shadowRadius = 5.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
  
  [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    
}

- (IBAction)revealMenu:(id)sender
{
  [self.slidingViewController anchorTopViewTo:ECRight];
}
- (IBAction)revealRight:(id)sender {
    [self.slidingViewController anchorTopViewTo:ECLeft];
}

// slidingViewController notification
- (void)underLeftWillAppear:(NSNotification *)notification
{
  NSLog(@"under left will appear");
}

- (void)topDidAnchorRight:(NSNotification *)notification
{
  NSLog(@"top did anchor right");
}

- (void)underRightWillAppear:(NSNotification *)notification
{
  NSLog(@"under right will appear");
}

- (void)topDidAnchorLeft:(NSNotification *)notification
{
  NSLog(@"top did anchor left");
}

- (void)topDidReset:(NSNotification *)notification
{
  NSLog(@"top did reset");
}

@end
