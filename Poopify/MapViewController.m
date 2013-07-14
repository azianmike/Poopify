//
//  MapViewController.m
//  Poopify
//
//  Created by Michael Luo on 7/9/13.
//  Copyright (c) 2013 Michael Luo. All rights reserved.
//

#import "MapViewController.h"
#import "ListViewController.h"
#import "BathroomAnnotation_Test.h"
#import "SelectedItemViewViewController.h"
#import "Bathroom.h"
#define METERS_PER_MILE 1609.344
@interface MapViewController ()
{
    NSArray *locationData;
}
@end

@implementation MapViewController

NSMutableArray *bathroom2;
static bool firstLoad=TRUE;
@synthesize bathrooms=_bathrooms;

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
    //[self setUpView];
	// Do any additional setup after loading the view.
    self.navigationItem.title = @"Map View";
    _mapView.delegate = self;
    //_currentLocation.startUpdatingLocation;
    _mapView.showsUserLocation=YES;
    

    //[_mapView userTrackingMode];
}

-(void)viewWillAppear:(BOOL)animated
{
    //_mapView.userLocation=YES;
    
    //[_mapView setUserTrackingMode:MKUserTrackingModeNone];

    [self plotBathrooms];

    if (!firstLoad) {
        [self centerView];
    }
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    if(firstLoad)
    {
        //self.mapView.centerCoordinate = userLocation.location.coordinate;
        
        [self centerView];
        firstLoad=FALSE;
    }
}

- (void) centerView {
    //self.mapView.centerCoordinate = *(userLocation);
    CLLocationCoordinate2D zoomLocation = _mapView.userLocation.coordinate;

    //if we are unable to read userLocation, let the updateUserLocation callback
    //continue to get called
    if ( zoomLocation.latitude == 0 &&
      zoomLocation.longitude == 0 )
    {
        firstLoad = TRUE;
    }
    NSLog(@"(%f,%f)",zoomLocation.latitude, zoomLocation.longitude);
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 1*METERS_PER_MILE, 1*METERS_PER_MILE);
    
    // 3
    [_mapView setRegion:viewRegion animated:YES];
    //[_mapView regionThatFits:viewRegion];
    //[_mapView setCenterCoordinate:zoomLocation animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    //firstLoad=FALSE;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openListView {
    
    //MapViewController *oView = [[MapViewController alloc]         initWithNibName:NSStringFromClass([MapViewController class])  bundle:nil];
    
    //oView.title = @"The Other View";
    //[self.navigationController pushViewController:oView animated:YES];
    
    //[self.storyboard instantiateViewControllerWithIdentifier:@"ListViewController"];
    ListViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ListViewController"];
    controller.bathrooms=_bathrooms;
    
    //[self.storyboard instantiateViewControllerWithIdentifier:controller];
    [self.navigationController pushViewController:controller animated:YES];
    
}


- (IBAction)openMainMenu {
    //[self.navigationController transitionFromViewController:self toViewController:@"MainViewController" duration:.5 options:(UIViewAnimationOptionTransitionFlipFromLeft) animations:nil completion:YES];
    //[self doTransitionWithType:UIViewAnimationOptionTransitionFlipFromLeft];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    //[self.navigationController pushViewController:controller animated:YES];

    firstLoad=TRUE;
}


/*
 * Put annotations on map
 *
 */

- (void)plotBathrooms {
    for (id<MKAnnotation> annotation in _mapView.annotations) {
        [_mapView removeAnnotation:annotation];
    }
    
   
    NSNumber * latitude = [NSNumber numberWithDouble:(39.0365 )];
    NSNumber * longitude = [NSNumber numberWithDouble:(-94.58334 )];
    NSString * description = @"Johnson Hall";
    NSString * address = @"StankRank: 7.2";
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = latitude.doubleValue;
    coordinate.longitude = longitude.doubleValue;
    
    BathroomAnnotation_Test *annotation = [[BathroomAnnotation_Test alloc] initWithName:description address:address coordinate:coordinate] ;
    [_mapView addAnnotation:annotation];
    
    
    latitude = [NSNumber numberWithDouble:(38.953502 )];
    longitude = [NSNumber numberWithDouble:(-94.525705)];
    description = @"McDonald's";
    address = @"StankRank: 6.5";

    coordinate.latitude = latitude.doubleValue;
    coordinate.longitude = longitude.doubleValue;
    
    annotation = [[BathroomAnnotation_Test alloc] initWithName:description address:address coordinate:coordinate] ;
    [_mapView addAnnotation:annotation];
    
    latitude = [NSNumber numberWithDouble:(38.943706 )];
    longitude = [NSNumber numberWithDouble:(-94.532409)];
    description = @"Cerner Innovation Campus";
    address = @"StankRank: 9.9";
    
    coordinate.latitude = latitude.doubleValue;
    coordinate.longitude = longitude.doubleValue;
    
    annotation = [[BathroomAnnotation_Test alloc] initWithName:description address:address coordinate:coordinate] ;
    [_mapView addAnnotation:annotation];
    
    latitude = [NSNumber numberWithDouble:(39.042411 )];
    longitude = [NSNumber numberWithDouble:(-94.589985)];
    description = @"Fogo De Chao";
    address = @"StankRank: 8.4";
    
    coordinate.latitude = latitude.doubleValue;
    coordinate.longitude = longitude.doubleValue;
    
    annotation = [[BathroomAnnotation_Test alloc] initWithName:description address:address coordinate:coordinate] ;
    [_mapView addAnnotation:annotation];
}


/*
 * Annotations and Callouts for BathroomAnnotation
 *
 *
 */

- (MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:(id <MKAnnotation>)annotation{
    
    MKAnnotationView *view = nil;
    //MKPinAnnotationView *view=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"HotSpotsLoc"];
    
    if(annotation !=_mapView.userLocation){
        //view = (MKAnnotationView *)
        view = (MKPinAnnotationView *)
        [_mapView dequeueReusableAnnotationViewWithIdentifier:@"identifier"];
        if(nil == view) {
            //view = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"identifier"];
            //view=[[MKAnnotationView alloc] init];
            view=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"identifier"];
            
        }
        
        //id <MKAnnotation> *currPlaceMark = &annotation;
        //NSLog(@"%i",currPlaceMark.position);
        
        //view.image = [UIImage imageNamed:@"1373616020_stock_toilet-paper.png"];
        /* view.pinColor = MKPinAnnotationColorRed;
         view.animatesDrop = YES;
         view.canShowCallout = YES;*/
        UIButton *btnViewVenue = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        view.rightCalloutAccessoryView=btnViewVenue;
        view.enabled = YES;
        view.canShowCallout = YES;
        view.multipleTouchEnabled = NO;
        
        //view.animatesDrop = YES;
        
    }
    return view;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    // here we illustrate how to detect which annotation type was clicked on for its callout
    id <MKAnnotation> annotation = [view annotation];
    if ([annotation isKindOfClass:[BathroomAnnotation_Test class]])
    {
        NSLog(@"clicked BathroomInfo");
    }
    /*SelectedItemViewViewController *controller =[self.storyboard instantiateViewControllerWithIdentifier:@"SelectedItemView"];
    TableViewCellControllerCell *passData = [[TableViewCellControllerCell alloc] init];
    passData.bathroomName
    [self.navigationController pushViewController:controller animated:YES];*/
}

@end
