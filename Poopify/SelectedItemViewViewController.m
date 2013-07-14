//
//  SelectedItemViewViewController.m
//  Poopify
//
//  Created by Michael Luo on 7/12/13.
//  Copyright (c) 2013 Michael Luo. All rights reserved.
//

#import "SelectedItemViewViewController.h"

@interface SelectedItemViewViewController ()

@end

@implementation SelectedItemViewViewController

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
    self.thumbsUpPercent2.text=_info.thumbsUpPercent.text;
    self.bathroomName.text=_info.bathroomName.text;
    self.thumbsDownPercent.text=_info.thumbsDownPercent.text;
    [self.thumbsUpPercent2 setNeedsDisplay];
    [self.thumbsDownPercent setNeedsDisplay];
    [self.bathroomName setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)transferInfo:(id*)sender
{
    
}
@end
