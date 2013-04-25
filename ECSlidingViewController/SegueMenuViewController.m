//
//  SegueMenuViewController.m
//  ECSlidingViewController
//
//  Created by Jonathan Bennett on 2012-11-13.
//
//

#import "SegueMenuViewController.h"
#import "ECSlidingViewController.h"

@interface SegueMenuViewController ()

@end

@implementation SegueMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.slidingViewController setAnchorRightRevealAmount:262.0f];
    self.slidingViewController.underLeftWidthLayout = ECFullWidth;
}
@end
