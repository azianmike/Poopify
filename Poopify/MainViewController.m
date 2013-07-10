//
//  MainViewController.m
//  Poopify
//
//  Created by Michael Luo on 7/8/13.
//  Copyright (c) 2013 Michael Luo. All rights reserved.
//

#import "MainViewController.h"
#import "MapViewController.h"
@interface MainViewController ()
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
@end

@implementation MainViewController
@synthesize redButton, greenButton, blueButton;
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"Root View";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    }
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.flipsidePopoverController = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
            self.flipsidePopoverController = popoverController;
            popoverController.delegate = self;
        }
    }
}

- (IBAction)togglePopover:(id)sender
{
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}



- (IBAction) doRedButton {
	//window.backgroundColor = [UIColor redColor];
    [[self view] setBackgroundColor:[UIColor redColor]];
}

- (IBAction) doGreenButton {
	//_window.backgroundColor = [UIColor greenColor];
    [[self view] setBackgroundColor:[UIColor greenColor]];
}

- (IBAction) doBlueButton {
	//_window.backgroundColor = [UIColor blueColor];
    [[self view] setBackgroundColor:[UIColor blueColor]];
}

- (IBAction)openMapView {
    
    //MapViewController *oView = [[MapViewController alloc]         initWithNibName:NSStringFromClass([MapViewController class])  bundle:nil];
    
    //oView.title = @"The Other View";
    //[self.navigationController pushViewController:oView animated:YES];
    
    [self.storyboard instantiateViewControllerWithIdentifier:@"MapViewController"];
    
}

- (IBAction)openListView {
    
    //MapViewController *oView = [[MapViewController alloc]         initWithNibName:NSStringFromClass([MapViewController class])  bundle:nil];
    
    //oView.title = @"The Other View";
    //[self.navigationController pushViewController:oView animated:YES];
    
    [self.storyboard instantiateViewControllerWithIdentifier:@"ListViewController"];
    
}



@end
