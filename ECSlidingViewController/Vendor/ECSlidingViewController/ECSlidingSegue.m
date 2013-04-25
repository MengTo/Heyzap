//
//  EXSlidingSegue.m
//  ECSlidingViewController
//
//  Created by Jonathan Bennett on 2012-11-13.
//
//

#import "ECSlidingSegue.h"
#import "ECSlidingViewController.h"

@implementation ECSlidingSegue

- (void)perform
{
    UIViewController *source = (UIViewController *)self.sourceViewController;
    UIViewController *destination = (UIViewController *)self.destinationViewController;
    ECSlidingViewController *slideVC = source.slidingViewController;
    ECSide side = (source == slideVC.underLeftViewController ||
                   source.navigationController == slideVC.underLeftViewController ||
                   source.tabBarController == slideVC.underLeftViewController) ? ECRight : ECLeft;
    
    [slideVC anchorTopViewOffScreenTo:side animations:nil onComplete:^{
        CGRect frame = slideVC.topViewController.view.frame;
        slideVC.topViewController = destination;
        slideVC.topViewController.view.frame = frame;
        [slideVC resetTopView];
        
        [destination.view addGestureRecognizer:slideVC.panGesture];
    }];
}

@end
