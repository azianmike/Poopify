//
//  SelectedItemViewViewController.h
//  Poopify
//
//  Created by Michael Luo on 7/12/13.
//  Copyright (c) 2013 Michael Luo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCellControllerCell.h"

@interface SelectedItemViewViewController : UIViewController

@property (nonatomic, assign) TableViewCellControllerCell *info;
@property (nonatomic, assign) IBOutlet UILabel *bathroomName;
@property (nonatomic, assign) IBOutlet UILabel *thumbsUpPercent2;
@property (nonatomic, assign) IBOutlet UILabel *thumbsDownPercent;

@property (nonatomic, assign) IBOutlet UIButton *thumbsUpButton;
@property (nonatomic, assign) IBOutlet UIButton *thumbsDownButton;


@end
