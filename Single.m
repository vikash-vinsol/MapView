

#import "Single.h"

@implementation Single
@synthesize locationManager;

+(Single *) theSingle
{
    static Single *theSingle = nil;
    if (!theSingle)
    {
        theSingle = [[super allocWithZone:nil] init];
    }
    return theSingle;
}

+(id)allocWithZone:(NSZone *)zone
{
    return [self theSingle];
}

- (id)init
{
    //If sharedInstance is nil, +initialize is our caller, so initialze the instance.
    //If it is not nil, simply return the instance without re-initializing it.
    self = [super init];
    if (self) 
        {
            locationManager = [[CLLocationManager alloc] init];
            geocoder = [[CLGeocoder alloc] init];
            locationManager.delegate = self;
            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
            [locationManager startUpdatingLocation];
        }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);

    
    if (newLocation != nil)
    {
        _latitude = [NSString stringWithFormat:@"%.8f", newLocation.coordinate.longitude];
        _longitude =[NSString stringWithFormat:@"%.8f", newLocation.coordinate.latitude];
    }
    // Stop Location Manager
     [locationManager stopUpdatingLocation];
   
    NSLog(@"Resolving the Address");
   [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error)
     {
         NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
         if (error == nil && [placemarks count] > 0)
         {
              placemark = [placemarks lastObject];
             _placemarkThoroughfare = [NSString stringWithFormat:@"Street: %@",placemark.thoroughfare];
             _placemarkPostalCode = [NSString stringWithFormat:@"Postal Code: %@",placemark.postalCode];
             _placemarkCity = [NSString stringWithFormat:@"City: %@",placemark.locality];
             _placemarkState = [NSString stringWithFormat:@"State: %@",placemark.locality];
             _placemarkCountry = [NSString stringWithFormat:@"Country: %@",placemark.country];
        }
         else
         {
             NSLog(@"%@", error.debugDescription);
         }
         
     } ];
}

@end
