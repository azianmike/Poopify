//
//  TableViewCellControllerCell.m
//  Poopify
//
//  Created by Michael Luo on 7/11/13.
//  Copyright (c) 2013 Michael Luo. All rights reserved.
//

#import "TableViewCellControllerCell.h"
#import "SelectedItemViewViewController.h"
@implementation TableViewCellControllerCell
//@synthesize bathroomName = _bathroomName;
@synthesize thumbsUpPercent = _thumbsUpPercent;
@synthesize thumbsDownPercent = _thumbsDownPercent;
@synthesize dollarImage = _dollarImage;
@synthesize toiletImage = _toiletImage;
@synthesize selectedItem=_selectedItem;
@synthesize storyboard=_storyboard;
@synthesize view=_view;
@synthesize navigationController;
@synthesize location=_location;
//@synthesize tableView=_tableView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)openSelectedItemView{
    //[self.storyboard instantiateViewControllerWithIdentifier:@"SelectedItemView"];
    SelectedItemViewViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"SelectedItemView"];
    controller.info=self;
    [self.navigationController pushViewController:controller animated:YES];
    
    
}


@end
