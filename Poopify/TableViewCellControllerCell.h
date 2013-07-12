//
//  TableViewCellControllerCell.h
//  Poopify
//
//  Created by Michael Luo on 7/11/13.
//  Copyright (c) 2013 Michael Luo. All rights reserved.
//

#import <UIKit/UIKit.h>
#define height 70;
@interface TableViewCellControllerCell : UITableViewCell


@property (nonatomic, weak) IBOutlet UILabel *bathroomName;
@property (nonatomic, weak) IBOutlet UILabel *thumbsUpPercent;
@property (nonatomic, weak) IBOutlet UILabel *thumbsDownPercent;
@property (nonatomic, weak) IBOutlet UIImageView *dollarImage;
@property (nonatomic, weak) IBOutlet UIImageView *toiletImage;

@end
