//
//  MapViewController.h
//  SingleTonMap
//
//  Created by Vikash Soni on 08/08/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


#import "TwoViewController.h"

@interface MapViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
{
}
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak,nonatomic) NSString *findLatitude;
@property (weak,nonatomic) NSString *findLongitude;

@end
