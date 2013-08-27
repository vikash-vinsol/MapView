//
//  MapViewController.m
//  SingleTonMap
//
//  Created by Vikash Soni on 08/08/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import "MapViewController.h"
#import "Single.h"
#import "Annotation.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CLLocationCoordinate2D findCoordinates;
    self.mapView.delegate = self;
    
    // Change string into Double
    double latDoubleValue = [[NSString stringWithFormat:@"%@",self.findLatitude] doubleValue];
    double longDoubleValue = [[NSString stringWithFormat:@"%@",self.findLongitude] doubleValue];

    // set up the coordinates for Searched location
    findCoordinates.latitude = latDoubleValue;
    findCoordinates.longitude= longDoubleValue;
    NSLog(@"New Locations %f %f",findCoordinates.latitude,findCoordinates.longitude);
    
    // creating Annotation for search Location
    Annotation *findAnnotation = [[Annotation alloc] init];
    findAnnotation.coordinate = findCoordinates;
    findAnnotation.title = @"Find Here";
    
    // Adding Annotation to the map View
    [self.mapView addAnnotation:findAnnotation];
    
    MKCoordinateRegion region = mapView.region;
    MKCoordinateSpan span;
    
    region.center = findCoordinates;
    span.latitudeDelta = 0.2;
    span.longitudeDelta = 0.2;
    region.span=span;
    [mapView setShowsUserLocation:YES];
    [mapView setRegion:region animated:YES];
}

@end
