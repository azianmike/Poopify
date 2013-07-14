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
- (void)plotBathrooms;
- (void) centerView;//:(MKMapView *)mapView centerView:(MKUserLocation *)userLocation;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) CLLocationManager *currentLocation;

@property (nonatomic, retain) IBOutlet UIButton *listButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *backButton;
@property (nonatomic, retain) NSMutableArray *bathrooms;


- (IBAction)openListView;
- (IBAction)openMainMenu;
@end
