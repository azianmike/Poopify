//
//  MapViewController.m
//  Poopify
//
//  Created by Michael Luo on 7/9/13.
//  Copyright (c) 2013 Michael Luo. All rights reserved.
//

#import "MapViewController.h"
#import "ListViewController.h"
#define METERS_PER_MILE 1609.344
@interface MapViewController ()

@end

@implementation MapViewController


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
    
    
    //_mapView.u
    
    /*CLLocationCoordinate2D zoomLocation;
    //zoomLocation.latitude = 39.281516;g
    zoomLocation.latitude = _currentLocation.location.coordinate.latitude;
    //zoomLocation.longitude= -76.580806;
    zoomLocation.longitude = _currentLocation.location.coordinate.longitude;
    
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    // 3
    [_mapView setRegion:viewRegion animated:NO];
    [_mapView regionThatFits:viewRegion];
    [_mapView setCenterCoordinate:zoomLocation animated:NO];*/
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    static bool firstLoad=false;
    if(firstLoad==TRUE)
    {
        //self.mapView.centerCoordinate = userLocation.location.coordinate;
        return;
    }
    self.mapView.centerCoordinate = userLocation.location.coordinate;
    CLLocationCoordinate2D zoomLocation;
    //zoomLocation.latitude = 39.281516;g
    zoomLocation.latitude = _mapView.userLocation.coordinate.latitude;
    //zoomLocation.longitude= -76.580806;
    zoomLocation.longitude = _mapView.userLocation.coordinate.longitude;
    
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    // 3
    [_mapView setRegion:viewRegion animated:YES];
    [_mapView regionThatFits:viewRegion];
    [_mapView setCenterCoordinate:zoomLocation animated:YES];
    firstLoad=true;
}

-(void)viewWillDisappear:(BOOL)animated
{
    
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
    
    [self.storyboard instantiateViewControllerWithIdentifier:@"ListViewController"];
    
    
}

-(void)setUpView{
    view1 = [[UIView alloc]initWithFrame:self.view.frame];
    view1.backgroundColor = [UIColor lightTextColor];
    view2 = [[UIView alloc]initWithFrame:self.view.frame];
    view2.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view1];
    [self.view sendSubviewToBack:view1];
    
}

-(void)doTransitionWithType:(UIViewAnimationOptions)animationTransitionType{
    if ([[self.view subviews] containsObject:view2 ]) {
        [UIView transitionFromView:view2
                            toView:view1
                          duration:2
                           options:animationTransitionType
                        completion:^(BOOL finished){
                            [view2 removeFromSuperview];
                        }];
        [self.view addSubview:view1];
        [self.view sendSubviewToBack:view1];
    }
    else{
        
        [UIView transitionFromView:view1
                            toView:view2
                          duration:2
                           options:animationTransitionType
                        completion:^(BOOL finished){
                            [view1 removeFromSuperview];
                        }];
        [self.view addSubview:view2];
        [self.view sendSubviewToBack:view2];
        
    }
}

- (IBAction)openMainMenu {
    //[self.navigationController transitionFromViewController:self toViewController:@"MainViewController" duration:.5 options:(UIViewAnimationOptionTransitionFlipFromLeft) animations:nil completion:YES];
    //[self doTransitionWithType:UIViewAnimationOptionTransitionFlipFromLeft];
    [self.navigationController popToRootViewControllerAnimated: YES];
}

@end
