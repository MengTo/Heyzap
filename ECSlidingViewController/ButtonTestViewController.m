//
//  ButtonTestViewController.m
//  Heyzap
//
//  Created by Meng To on 5/1/13.
//
//

#import "ButtonTestViewController.h"

@interface ButtonTestViewController ()

@end

@implementation ButtonTestViewController

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
    
    [self.buttonTest setBackgroundImage:[[UIImage imageNamed:@"but_green.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(20, 10, 20, 10)] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setButtonTest:nil];
    [super viewDidUnload];
}
@end
