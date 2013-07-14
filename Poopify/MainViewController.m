//
//  MainViewController.m
//  Poopify
//
//  Created by Michael Luo on 7/8/13.
//  Copyright (c) 2013 Michael Luo. All rights reserved.
//

#import "MainViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "Bathroom.h"
#import "MapViewController.h"
#import "ListViewController.h"
@interface MainViewController ()
{
    NSArray *tableData;
    NSArray *locationData;
}
@end

@implementation MainViewController
@synthesize redButton, greenButton, blueButton;
@synthesize bathrooms;
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad
{
    //[self.navigationController setNavigationBarHidden:YES animated:YES];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"Poopify Me Captain";
    self.navigationItem.hidesBackButton=YES;
    
    tableData = [NSArray arrayWithObjects:@"Innovations Campus", @"McDonalds", @"Johnson Hall", @"Fogo De Chao", nil];
    CLLocation *fogoDeChao2=[[CLLocation alloc] initWithLatitude:39.042411 longitude:-94.589985];
    CLLocation *IC2=[[CLLocation alloc] initWithLatitude:38.943706 longitude:-94.532409];
    CLLocation *mcdonalds2=[[CLLocation alloc] initWithLatitude:38.953502 longitude:-94.525705];
    CLLocation *johnsonHall2=[[CLLocation alloc] initWithLatitude:39.036553 longitude:-94.583285];
    
    //locationData=[NSArray arrayWithObjects:IC, mcdonalds, johnsonHall,fogoDeChao, nil];
    bathrooms = [[NSMutableArray alloc] init];
    Bathroom *IC=[[Bathroom alloc] init];
    Bathroom *fogoDeChao=[[Bathroom alloc] init];
    Bathroom *mcdonalds=[[Bathroom alloc] init];
    Bathroom *johnsonHall=[[Bathroom alloc] init];
    IC.bathroomName.text=@"Innovations Campus";
    fogoDeChao.bathroomName.text=@"Fogo De Chao";
    johnsonHall.bathroomName.text=@"Johnson Hall";
    mcdonalds.bathroomName.text=@"McDonalds";
    
    IC.location=IC2;
    mcdonalds.location=mcdonalds2;
    johnsonHall.location=johnsonHall2;
    fogoDeChao.location=fogoDeChao2;
    [bathrooms addObject:IC];
    [bathrooms addObject:fogoDeChao];
    [bathrooms addObject:johnsonHall];
    [bathrooms addObject:mcdonalds];
    
    for(int i=0; i<[bathrooms count]; i++)
    {
        int thumbsUpNumber=arc4random()%100;
        int thumbsDownNumber=100-thumbsUpNumber;
        //randomNumber=0+randomNumber%(100);
        
        
        ((Bathroom *)[bathrooms objectAtIndex:i]).storyboard=[self storyboard];
        
        NSString *thumbsUpLabel=[NSString stringWithFormat:@"%d%%", thumbsUpNumber];
        NSString *thumbsDownLabel=[NSString stringWithFormat:@"%d%%", thumbsDownNumber];
        ((Bathroom *)[bathrooms objectAtIndex:i]).thumbsUpPercent.text=thumbsUpLabel;
        ((Bathroom *)[bathrooms objectAtIndex:i]).thumbsDownPercent.text=thumbsDownLabel;
        ((Bathroom *)[bathrooms objectAtIndex:i]).navigationController=self.navigationController;
        static int dollarCount=0;
        static int toiletCount=1;
        ((Bathroom *)[bathrooms objectAtIndex:i]).dollarImage.alpha=dollarCount;
        ((Bathroom *)[bathrooms objectAtIndex:i]).toiletImage.alpha=toiletCount;
        if(dollarCount==0)
            dollarCount=1;
        else
            dollarCount=0;
        if(toiletCount==0)
            toiletCount=1;
        else
            toiletCount=0;
    }
    
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

- (IBAction) reset {
	//_window.backgroundColor = [UIColor blueColor];
    [[self view] setBackgroundColor:[UIColor whiteColor]];
}

- (IBAction)openMapView {
    
    //MapViewController *oView = [[MapViewController alloc]         initWithNibName:NSStringFromClass([MapViewController class])  bundle:nil];
    
    //oView.title = @"The Other View";
    //[self.navigationController pushViewController:oView animated:YES];
    MapViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"MapViewController"];
    controller.bathrooms=bathrooms;
    //[self.storyboard instantiateViewControllerWithIdentifier:controller];
    [self.navigationController pushViewController:controller animated:YES];
    
}

- (IBAction)openListView {
    
    //MapViewController *oView = [[MapViewController alloc]         initWithNibName:NSStringFromClass([MapViewController class])  bundle:nil];
    
    //oView.title = @"The Other View";
    //[self.navigationController pushViewController:oView animated:YES];
    
    //[self.storyboard instantiateViewControllerWithIdentifier:@"ListViewController"];
    
    ListViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ListViewController"];
    controller.bathrooms=bathrooms;
    //[self.storyboard instantiateViewControllerWithIdentifier:controller];
    [self.navigationController pushViewController:controller animated:YES];
    
}



@end
