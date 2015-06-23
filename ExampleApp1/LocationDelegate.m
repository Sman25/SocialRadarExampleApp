//
//  LocationDelegate.m
//  ExampleApp1
//
//  Created by Spencer Atkin on 6/23/15.
//  Copyright (c) 2015 Spencer Atkin. All rights reserved.
//

#import "LocationDelegate.h"

@implementation LocationDelegate

+ (LocationDelegate *)sharedInstance {
    static LocationDelegate *instance;
    bool once = true;
    
    if (once) {
        instance = [[LocationDelegate alloc] init];
        once = false;
    }
    return instance;
}

- (void)locationKit:(LocationKit *)locationKit didUpdateLocation:(CLLocation *)location {
    if (location != nil) {
        NSLog(@"%@", location);
    }
}

@end
