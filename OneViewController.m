
#import "OneViewController.h"
#import "Single.h"

@interface OneViewController ()

@end

@implementation OneViewController
@synthesize addressLable1,addressLable2,addressLable3,addressLable4,addressLable5,oneLong,oneLat;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [Single theSingle];    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)findButton:(id)sender
{
    NSLog(@"%@",[[Single theSingle]latitude]);
    oneLat.text = [NSString stringWithFormat:@"Latitude: %@",[[Single theSingle] latitude]];
    oneLong.text=[NSString stringWithFormat:@"Longitude: %@",[[Single theSingle] longitude]];
    addressLable1.text = [[Single theSingle]placemarkThoroughfare];
    addressLable2.text = [[Single theSingle]placemarkPostalCode];
    addressLable3.text = [[Single theSingle]placemarkCity];
    addressLable4.text = [[Single theSingle]placemarkState];
    addressLable5.text = [[Single theSingle]placemarkCountry];
    
    if ([addressLable2.text isEqualToString:@"Postal Code: (null)"])
    {
        addressLable2.text = @"Postal Code: Not Found";
    }
    if ([addressLable2.text isEqualToString:@"Street: (null)"])
    {
        addressLable2.text = @"Street: Not Found";
    }
    if ([addressLable2.text isEqualToString:@"City: (null)"])
    {
        addressLable2.text = @"City: Not Found";
    }
    if ([addressLable2.text isEqualToString:@"State: (null)"])
    {
        addressLable2.text = @"State: Not Found";
    }
    
}

@end
