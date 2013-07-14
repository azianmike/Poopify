//
//  Bathroom.h
//  Poopify
//
//  Created by Michael Luo on 7/13/13.
//  Copyright (c) 2013 Michael Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreFoundation/CoreFoundation.h>

@interface Bathroom : NSObject
@property (nonatomic, weak) UILabel *bathroomName;
@property (nonatomic, weak) UILabel *thumbsUpPercent;
@property (nonatomic, weak) UILabel *thumbsDownPercent;
@property (nonatomic, weak) UIImageView *dollarImage;
@property (nonatomic, weak) UIImageView *toiletImage;
@property (nonatomic, retain) UIButton *selectedItem;
@property (nonatomic, weak) UIStoryboard *storyboard;
@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) UINavigationController *navigationController;

@property (nonatomic, assign) CLLocation *location;

@end
