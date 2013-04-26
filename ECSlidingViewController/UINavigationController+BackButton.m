//
//  UINavigationController+BackButton.m
//  Heyzap
//
//  Created by Meng To on 4/25/13.
//
//

#import "UINavigationController+BackButton.h"

@implementation UINavigationController (BackButton)

-(IBAction)backButton:(UIStoryboardSegue *)sender {
    [self popViewControllerAnimated:YES];
}

@end
