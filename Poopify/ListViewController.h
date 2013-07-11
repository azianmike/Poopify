//
//  ListViewController.h
//  Poopify
//
//  Created by Michael Luo on 7/9/13.
//  Copyright (c) 2013 Michael Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController
{
    UIView *view1;
    UIView *view2;
}

@property (nonatomic, retain) IBOutlet UIButton *mapButton;
@property (nonatomic, retain) IBOutlet UIButton *mainMenu;
//@property (nonatomic, retain) IBOutlet UIBarButtonItem *backButton;
- (IBAction)openMapView;
- (IBAction)openMainMenu;
@end
