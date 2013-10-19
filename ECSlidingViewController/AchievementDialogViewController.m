//
//  AchievementDialogViewController.m
//  Heyzap
//
//  Created by Meng To on 5/1/13.
//
//

#import "AchievementDialogViewController.h"

@interface AchievementDialogViewController ()

@end

@implementation AchievementDialogViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UIButton *myDialog = self.Dialog;
    
    // Starting position
    myDialog.center = CGPointMake(myDialog.center.x, 0);
    
    [UIView animateWithDuration:0.3/1.5 animations:^{
        // Forward position
        myDialog.center = CGPointMake(myDialog.center.x, 284);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            // Backward position
            myDialog.center = CGPointMake(myDialog.center.x, 269);
        } completion:^(BOOL finished) {
            // End position
            myDialog.center = CGPointMake(myDialog.center.x, 274);
        }];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setDialog:nil];
    [super viewDidUnload];
}
@end
