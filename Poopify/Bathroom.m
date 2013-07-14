//
//  Bathroom.m
//  Poopify
//
//  Created by Michael Luo on 7/13/13.
//  Copyright (c) 2013 Michael Luo. All rights reserved.
//

#import "Bathroom.h"

@implementation Bathroom
@synthesize bathroomName = _bathroomName;
@synthesize thumbsUpPercent = _thumbsUpPercent;
@synthesize thumbsDownPercent = _thumbsDownPercent;
@synthesize dollarImage = _dollarImage;
@synthesize toiletImage = _toiletImage;
@synthesize selectedItem=_selectedItem;
@synthesize storyboard=_storyboard;
@synthesize view=_view;
@synthesize navigationController;

-(id)init
{
    _bathroomName=[[UILabel alloc] init];
    _thumbsDownPercent=[[UILabel alloc] init];
    _thumbsUpPercent=[[UILabel alloc] init];
    _dollarImage=[[UIImageView alloc] init];
    _toiletImage=[[UIImageView alloc] init];
    return self;
}

@end
