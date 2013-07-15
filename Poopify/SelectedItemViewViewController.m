//
//  SelectedItemViewViewController.m
//  Poopify
//
//  Created by Michael Luo on 7/12/13.
//  Copyright (c) 2013 Michael Luo. All rights reserved.
//

#import "SelectedItemViewViewController.h"
#define METERS_PER_MILE 1609.344

@interface SelectedItemViewViewController ()

@end

@implementation SelectedItemViewViewController
static bool firstLoad;

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
    /*self.thumbsUpPercent2.text=_info.thumbsUpPercent.text;
    self.bathroomName.text=_info.bathroomName.text;
    self.thumbsDownPercent.text=_info.thumbsDownPercent.text;*/
    
    self.thumbsUpPercent2.text=_data.thumbsUpPercent.text;
    self.bathroomName.text=_data.bathroomName.text;
    self.thumbsDownPercent.text=_data.thumbsDownPercent.text;
    
    [self.thumbsUpPercent2 setNeedsDisplay];
    [self.thumbsDownPercent setNeedsDisplay];
    [self.bathroomName setNeedsDisplay];
    firstLoad=FALSE;
    [_mapView setDelegate:self];
    //_mapView.frame=CGRectMake(40, 20, 240, 128);
    _mapView.showsUserLocation=YES;
    
}

-(void)viewDidAppear:(BOOL)animated
{
    //_mapView.frame=CGRectMake(40, 20, 240, 128);
}


- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    
    if(firstLoad==TRUE)
    {
        //self.mapView.centerCoordinate = userLocation.location.coordinate;
        return;
    }
    self.mapView.centerCoordinate = userLocation.location.coordinate;
    CLLocationCoordinate2D zoomLocation;
    //zoomLocation.latitude = 39.281516;g
    zoomLocation.latitude = _data.location.coordinate.latitude;
    //zoomLocation.longitude= -76.580806;
    zoomLocation.longitude = _data.location.coordinate.longitude;
    
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    // 3
    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
    pin.coordinate=zoomLocation;
    [_mapView addAnnotation:pin];
    [_mapView setRegion:viewRegion animated:NO];
    [_mapView regionThatFits:viewRegion];
    [_mapView setCenterCoordinate:zoomLocation animated:NO];
    
    firstLoad=TRUE;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)thumbsUpButtonPressed
{
    if(![_data getVoted])
    {
        NSString *percent = _thumbsUpPercent2.text;
        [percent substringToIndex:([percent length]-1)];
        int percentValue=[percent intValue];
        percentValue++;
        NSString *newValue = [NSString stringWithFormat:@"%d%%", percentValue];
        _thumbsUpPercent2.text=newValue;
        _data.thumbsUpPercent.text=newValue;
        
        percent = _thumbsDownPercent.text;
        [percent substringToIndex:([percent length]-1)];
        percentValue=[percent intValue];
        percentValue--;
        newValue = [NSString stringWithFormat:@"%d%%", percentValue];
        _thumbsDownPercent.text=newValue;
        _data.thumbsDownPercent.text=newValue;
        [_data setVoted];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Voted"
                                                        message:@"You think this bathroom isn't super crappy!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                        message:@"You Already Voted!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
}
-(IBAction)thumbsDownButtonPressed
{
    if(![_data getVoted])
    {
        NSString *percent = _thumbsUpPercent2.text;
        [percent substringToIndex:([percent length]-1)];
        int percentValue=[percent intValue];
        percentValue--;
        NSString *newValue = [NSString stringWithFormat:@"%d%%", percentValue];
        _thumbsUpPercent2.text=newValue;
        _data.thumbsUpPercent.text=newValue;
        
        percent = _thumbsDownPercent.text;
        [percent substringToIndex:([percent length]-1)];
        percentValue=[percent intValue];
        percentValue++;
        newValue = [NSString stringWithFormat:@"%d%%", percentValue];
        _thumbsDownPercent.text=newValue;
        _data.thumbsDownPercent.text=newValue;
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Voted"
                                                        message:@"You think this bathroom IS super crappy!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [_data setVoted];
    }else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                        message:@"You Already Voted!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}
@end
