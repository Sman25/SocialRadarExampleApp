//
//  LocationDelegate.h
//  ExampleApp1
//
//  Created by Spencer Atkin on 6/23/15.
//  Copyright (c) 2015 Spencer Atkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LocationKit/LocationKit.h>

@interface LocationDelegate : NSObject <LocationKitDelegate>

+ (LocationDelegate *)sharedInstance;

- (void)locationKit:(LocationKit *)locationKit didUpdateLocation:(CLLocation *)location;

@end
