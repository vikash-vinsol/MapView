//
//  OneViewController.h
//  SingleTonMap
//
//  Created by Vikash Soni on 07/08/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface OneViewController : UIViewController<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
    UIActivityIndicatorView *_activityIndicatorView;
}

- (IBAction)findButton:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *oneLat;
@property (strong, nonatomic) IBOutlet UILabel *oneLong;
@property (strong,nonatomic) IBOutlet UILabel *addressLable1;
@property (strong,nonatomic) IBOutlet UILabel *addressLable2;
@property (strong,nonatomic) IBOutlet UILabel *addressLable3;
@property (strong,nonatomic) IBOutlet UILabel *addressLable4;
@property (strong,nonatomic) IBOutlet UILabel *addressLable5;

@end
