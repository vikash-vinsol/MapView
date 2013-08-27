//
//  Single.h
//  SingleTonMap
//
//  Created by Vikash Soni on 07/08/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "OneViewController.h"


@interface Single : NSObject<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}

@property (nonatomic,strong) NSString *latitude;
@property (nonatomic,strong) NSString *longitude;
@property (nonatomic,strong) NSString *placemarkSubThoughtFare;
@property (nonatomic,strong) NSString *placemarkThoroughfare;
@property (nonatomic,strong) NSString *placemarkPostalCode;
@property (nonatomic,strong) NSString *placemarkCity;
@property (nonatomic,strong) NSString *placemarkState;
@property (nonatomic,strong) NSString *placemarkCountry;
@property (nonatomic,strong) CLLocationManager *locationManager;

+(Single *) theSingle;

@end
