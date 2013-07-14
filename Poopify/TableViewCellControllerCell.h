//
//  TableViewCellControllerCell.h
//  Poopify
//
//  Created by Michael Luo on 7/11/13.
//  Copyright (c) 2013 Michael Luo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreFoundation/CoreFoundation.h>
#import "Bathroom.h"
#define height 70;


@interface TableViewCellControllerCell : UITableViewCell


@property (nonatomic, weak) IBOutlet UILabel *bathroomName;
@property (nonatomic, weak) IBOutlet UILabel *thumbsUpPercent;
@property (nonatomic, weak) IBOutlet UILabel *thumbsDownPercent;
@property (nonatomic, weak) IBOutlet UIImageView *dollarImage;
@property (nonatomic, weak) IBOutlet UIImageView *toiletImage;
@property (nonatomic, retain) IBOutlet UIButton *selectedItem;
@property (nonatomic, weak) IBOutlet UIStoryboard *storyboard;
@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) UINavigationController *navigationController;

@property (nonatomic, assign) CLLocation *location;

@property (nonatomic, strong) Bathroom *data;

-(IBAction)openSelectedItemView;

@end
