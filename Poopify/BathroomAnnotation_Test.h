//
//  BathroomAnnotation.h
//  MapTest
//
//  Created by Luo,Michael on 7/10/13.
//  Copyright (c) 2013 Luo,Michael. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface BathroomAnnotation_Test : NSObject <MKAnnotation>

- (id)initWithName:(NSString*)name address:(NSString*)address coordinate:(CLLocationCoordinate2D)coordinate;
- (MKMapItem*)mapItem;

@end