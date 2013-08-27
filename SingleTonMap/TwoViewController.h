//
//  TwoViewController.h
//  SingleTonMap
//
//  Created by Vikash Soni on 07/08/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MapViewController.h"

@interface TwoViewController : UIViewController<UITextFieldDelegate>
{
    CLGeocoder *_geocoder;
    __weak UITextField *_streetField;
    __weak UITextField *_cityField;
    __weak UITextField *_countryField;
    __weak UIButton *_fetchCoordinatesButton;
    __weak UILabel *_nameLabel;
    __weak UILabel *_coordinatesLabel;
    __weak UILabel *_longitudeLabel;
    __weak UIActivityIndicatorView *_activityIndicatorView;
}

@property (nonatomic, strong) CLGeocoder *geocoder;
@property (nonatomic, weak) IBOutlet UITextField *streetField;
@property (nonatomic, weak) IBOutlet UITextField *cityField;
@property (nonatomic, weak) IBOutlet UITextField *countryField;
@property (nonatomic, weak) IBOutlet UIButton *fetchCoordinatesButton;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *coordinatesLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *twoLat;
@property (weak, nonatomic) IBOutlet UILabel *twoLong;
@property (weak, nonatomic) IBOutlet UIButton *MapButton;
- (IBAction)fetchCoordinates:(id)sender;

@end
