//
//  ContainerViewController.m
//  EmbeddedSwapping
//
//  Created by Michael Luton on 11/13/12.
//  Copyright (c) 2012 Sandmoose Software. All rights reserved.
//  Heavily inspired by http://orderoo.wordpress.com/2012/02/23/container-view-controllers-in-the-storyboard/
//

#import "ContainerViewController.h"

#define SegueIdentifierFirst @"embedFirst"
#define SegueIdentifierSecond @"embedSecond"

@interface ContainerViewController ()

@property (strong, nonatomic) NSString *currentSegueIdentifier;
@property (strong, nonatomic) UIViewController *firstViewController;
@property (strong, nonatomic) UIViewController *secondViewController;

@end

@implementation ContainerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (!self.segueID1 || !self.segueID2) {
        [NSException raise:@"Not enough Segue IDs" format:@"The container view controller did not have both segue IDs set correctly. Set them on the Storyboard in the User Defined Runtime Attributes section, inside the Identity Inspector tab"];
    }
    
    self.currentSegueIdentifier = self.segueID1;
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Instead of creating new VCs on each seque we want to hang on to existing
    // instances if we have it. Remove the second condition of the following
    // two if statements to get new VC instances instead.
    if (([segue.identifier isEqualToString:self.segueID1]) && !self.firstViewController) {
        self.firstViewController = segue.destinationViewController;
    }
    
    if (([segue.identifier isEqualToString:self.segueID2]) && !self.secondViewController) {
        self.secondViewController = segue.destinationViewController;
    }
    
    // If we're going to the first view controller.
    if ([segue.identifier isEqualToString:self.segueID1]) {
        // If this is not the first time we're loading this.
        if (self.childViewControllers.count > 0) {
            [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.firstViewController];
        }
        else {
            // If this is the very first time we're loading this we need to do
            // an initial load and not a swap.
            [self addChildViewController:segue.destinationViewController];
            ((UIViewController *)segue.destinationViewController).view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:((UIViewController *)segue.destinationViewController).view];
            [segue.destinationViewController didMoveToParentViewController:self];
        }
    }
    // By definition the second view controller will always be swapped with the
    // first one.
    else if ([segue.identifier isEqualToString:self.segueID2]) {
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.secondViewController];
    }
}

- (void)swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController
{
    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];
    [self transitionFromViewController:fromViewController toViewController:toViewController duration:0 options:UIViewAnimationOptionTransitionNone animations:nil completion:^(BOOL finished) {
        [fromViewController removeFromParentViewController];
        [toViewController didMoveToParentViewController:self];
    }];
}

- (void)swapViewControllers
{
    self.currentSegueIdentifier = ([self.currentSegueIdentifier isEqualToString:self.segueID1]) ? self.segueID2 : self.segueID1;
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
}


@end
