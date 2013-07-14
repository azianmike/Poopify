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
@property (nonatomic, strong) UILabel *bathroomName;
@property (nonatomic, strong) UILabel *thumbsUpPercent;
@property (nonatomic, strong) UILabel *thumbsDownPercent;
@property (nonatomic, strong) UIImageView *dollarImage;
@property (nonatomic, strong) UIImageView *toiletImage;
@property (nonatomic, retain) UIButton *selectedItem;
@property (nonatomic, strong) UIStoryboard *storyboard;
@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) UINavigationController *navigationController;

@property (nonatomic, strong) CLLocation *location;

@end
