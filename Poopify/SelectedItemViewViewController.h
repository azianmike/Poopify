//
//  SelectedItemViewViewController.h
//  Poopify
//
//  Created by Michael Luo on 7/12/13.
//  Copyright (c) 2013 Michael Luo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCellControllerCell.h"
#import <MapKit/MapKit.h>
#import "Bathroom.h"

@interface SelectedItemViewViewController : UIViewController<MKMapViewDelegate, MKAnnotation>

@property (nonatomic, assign) TableViewCellControllerCell *info;
@property (nonatomic, assign) IBOutlet UILabel *bathroomName;
@property (nonatomic, assign) IBOutlet UILabel *thumbsUpPercent2;
@property (nonatomic, assign) IBOutlet UILabel *thumbsDownPercent;

@property (nonatomic, assign) IBOutlet UIButton *thumbsUpButton;
@property (nonatomic, assign) IBOutlet UIButton *thumbsDownButton;
@property (nonatomic, weak) IBOutlet MKMapView *mapView;

@property (nonatomic, strong) Bathroom *data;



-(IBAction)thumbsUpButtonPressed;
-(IBAction)thumbsDownButtonPressed;

@end
