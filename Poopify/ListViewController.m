//
//  ListViewController.m
//  Poopify
//
//  Created by Michael Luo on 7/9/13.
//  Copyright (c) 2013 Michael Luo. All rights reserved.
//
#include <stdlib.h>
#import <UIKit/UIKit.h>
#import "ListViewController.h"
#import "TableViewCellControllerCell.h"
#import <CoreLocation/CoreLocation.h>
#import "Bathroom.h"
#import "MapViewController.h"
@interface ListViewController ()

@end

@implementation ListViewController
{
    NSArray *tableData;
    NSArray *locationData;
}

@synthesize bathrooms;
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
    //[self.navigationController setNavigationBarHidden:NO animated:YES];
    [super viewDidLoad];
    [self setUpView];
    tableData = [NSArray arrayWithObjects:@"Innovations Campus", @"McDonalds", @"Johnson Hall", @"Fogo De Chao", nil];
    CLLocation *fogoDeChao=[[CLLocation alloc] initWithLatitude:39.042411 longitude:-94.589985];
    CLLocation *IC=[[CLLocation alloc] initWithLatitude:38.943706 longitude:-94.532409];
    CLLocation *mcdonalds=[[CLLocation alloc] initWithLatitude:38.953502 longitude:-94.525705];
    CLLocation *johnsonHall=[[CLLocation alloc] initWithLatitude:39.036553 longitude:-94.583285];
    
    locationData=[NSArray arrayWithObjects:IC, mcdonalds, johnsonHall,fogoDeChao, nil];
	// Do any additional setup after loading the view.

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    TableViewCellControllerCell *cell = (TableViewCellControllerCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    /*int thumbsUpNumber=arc4random()%100;
    int thumbsDownNumber=100-thumbsUpNumber;
    //randomNumber=0+randomNumber%(100);
    cell.bathroomName.text = [tableData objectAtIndex:indexPath.row];
    cell.location=[locationData objectAtIndex:indexPath.row];
    cell.storyboard=[self storyboard];
    cell.view = [self view];
    NSString *thumbsUpLabel=[NSString stringWithFormat:@"%d%%", thumbsUpNumber];
    NSString *thumbsDownLabel=[NSString stringWithFormat:@"%d%%", thumbsDownNumber];
    cell.thumbsUpPercent.text=thumbsUpLabel;
    cell.thumbsDownPercent.text=thumbsDownLabel;
    cell.navigationController=self.navigationController;
    static int dollarCount=0;
    static int toiletCount=1;
    cell.dollarImage.alpha=dollarCount;
    cell.toiletImage.alpha=toiletCount;
    if(dollarCount==0)
        dollarCount=1;
    else
        dollarCount=0;
    if(toiletCount==0)
        toiletCount=1;
    else
        toiletCount=0;
    */
    Bathroom *current=((Bathroom *)[bathrooms objectAtIndex:indexPath.row]);
    cell.bathroomName.text=current.bathroomName.text;
    cell.thumbsDownPercent.text=current.thumbsDownPercent.text;
    cell.thumbsUpPercent.text=current.thumbsUpPercent.text;
    cell.dollarImage=current.dollarImage;
    cell.toiletImage=current.toiletImage;
    cell.navigationController=self.navigationController;
    cell.storyboard=[self storyboard];
    cell.location=current.location;
    cell.data=current;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return height;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated
{
    
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

-(IBAction)flipFromLeft:(id)sender
{
    //[self doTransitionWithType:UIViewAnimationOptionTransitionFlipFromLeft];
}

- (IBAction)openMainMenu {
    //[self.navigationController transitionFromViewController:self toViewController:@"MainViewController" duration:.5 options:(UIViewAnimationOptionTransitionFlipFromLeft) animations:nil completion:YES];
    //[self doTransitionWithType:UIViewAnimationOptionTransitionFlipFromRight];
    [self.navigationController popToRootViewControllerAnimated: YES];
}



@end
