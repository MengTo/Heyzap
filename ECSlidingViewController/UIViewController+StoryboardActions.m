//
//  UIViewController+StoryboardActions.m
//  Heyzap
//
//  Created by Maximilian Tagher on 4/29/13.
//
//

#import "UIViewController+StoryboardActions.h"
#import "ContainerViewController.h"

@implementation UIViewController (StoryboardActions)

- (IBAction)toggleContainers:(id)sender {
    for (UIViewController *controller in self.childViewControllers) {
        if ([controller isKindOfClass:[ContainerViewController class]]) {
            [(ContainerViewController *)controller swapViewControllers];
        }
    }
}

- (IBAction)toggleSelected:(UIButton *)sender {
    sender.selected = !sender.selected;
}

@end
