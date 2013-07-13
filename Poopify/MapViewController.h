//
//  MapViewController.h
//  Poopify
//
//  Created by Michael Luo on 7/9/13.
//  Copyright (c) 2013 Michael Luo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController<MKMapViewDelegate>
{
    UIView *view1;
    UIView *view2;
}
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) CLLocationManager *currentLocation;
//@property (nonatomic, strong) IBOutlet MKMapView * mapView;
@property (nonatomic, retain) IBOutlet UIButton *listButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *backButton;
- (IBAction)openListView;
- (IBAction)openMainMenu;
@end
