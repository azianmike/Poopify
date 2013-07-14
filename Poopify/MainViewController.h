//
//  MainViewController.h
//  Poopify
//
//  Created by Michael Luo on 7/8/13.
//  Copyright (c) 2013 Michael Luo. All rights reserved.
//

#import "FlipsideViewController.h"


@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIPopoverControllerDelegate, UITextFieldDelegate>


@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;
//@property (strong, nonatomic) UINavigationController *navigationController;
@property (nonatomic, retain) IBOutlet UIButton *redButton;
@property (nonatomic, retain) IBOutlet UIButton *greenButton;
@property (nonatomic, retain) IBOutlet UIButton *blueButton;
@property (nonatomic, retain) IBOutlet UIButton *resetButton;
@property (nonatomic, retain) NSMutableArray *bathrooms;

- (IBAction)openMapView;
- (IBAction)openListView;

- (IBAction)doRedButton;
- (IBAction)doGreenButton;
- (IBAction)doBlueButton;
- (IBAction)reset;

@end
