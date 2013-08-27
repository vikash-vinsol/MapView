//
//  TwoViewController.m
//  SingleTonMap
//
//  Created by Vikash Soni on 07/08/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import "TwoViewController.h"
#import "Single.h"
#import "MapViewController.h"

@interface TwoViewController ()
@end

@implementation TwoViewController
@synthesize geocoder = _geocoder;
@synthesize streetField = _streetField, cityField = _cityField, countryField = _countryField, fetchCoordinatesButton = _fetchCoordinatesButton, nameLabel = _nameLabel, coordinatesLabel = _coordinatesLabel,MapButton,longitudeLabel = _longitudeLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _twoLat.text = [NSString stringWithFormat:@"Current Latitude: %@",[[Single theSingle] latitude]];
    _twoLong.text = [NSString stringWithFormat:@"Current Longitude: %@",[[Single theSingle] longitude]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)fetchCoordinates:(id)sender
{
    if (!self.geocoder)
    {
        self.geocoder = [[CLGeocoder alloc] init];
    }
    
    NSString *address = [NSString stringWithFormat:@"%@ %@ %@", self.streetField.text, self.cityField.text, self.countryField.text];
    
    [self.geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error)
    {
        if ([placemarks count] > 0)
        {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            CLLocation *location = placemark.location;
            CLLocationCoordinate2D coordinate = location.coordinate;
                        
            self.coordinatesLabel.text = [NSString stringWithFormat:@"%f", coordinate.latitude];
            self.longitudeLabel.text = [NSString stringWithFormat:@"%f",coordinate.longitude];
                                          
            if ([placemark.areasOfInterest count] > 0)
            {
                self.nameLabel.text = [placemark.areasOfInterest objectAtIndex:0];
                NSLog(@"%@",placemark.areasOfInterest);

            }
        }
        else if ([placemarks count] == 0)
        {
            self.nameLabel.text = @"No Area of Interest Was Found";
            self.coordinatesLabel.text = @"Try";
            self.longitudeLabel.text = @"Again";
        }
        
        if ([self.nameLabel.text isEqualToString:@"Place" ] || [self.coordinatesLabel.text isEqualToString:@"Latitude"]  ||  [self.coordinatesLabel.text isEqualToString:@"Try"])
        {
            MapButton.enabled = NO;
        }
        else
        {
            MapButton.enabled = YES;
        }
    }];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MapViewController *transferViewController = segue.destinationViewController;
    if([segue.identifier isEqualToString:@"showDetailSegue"])
    {
        transferViewController.findLatitude = self.coordinatesLabel.text;
        transferViewController.findLongitude = self.longitudeLabel.text;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_streetField resignFirstResponder];
    [_cityField resignFirstResponder];
    [_countryField resignFirstResponder];
   return YES;
}

@end
