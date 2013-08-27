//
//  Annotation.h
//  SingleTonMap
//
//  Created by Vikash Soni on 08/08/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject<MKAnnotation>

@property(nonatomic,assign) CLLocationCoordinate2D coordinate;
@property(nonatomic,copy) NSString *title;

@end
