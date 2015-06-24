//
//  MapViewController.m
//  ExampleApp1
//
//  Created by Spencer Atkin on 6/23/15.
//  Copyright (c) 2015 Spencer Atkin. All rights reserved.
//

#import "MapViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "TabBarViewController.h"
#import "ListViewController.h"

#define TAB_BAR_VC (TabBarViewController *)[self parentViewController]

@interface MapViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController

TabBarViewController *parentVC;
ListViewController *listVC;

- (void)viewDidLoad {
    [super viewDidLoad];
    [_mapView setDelegate:self];
    parentVC = (TabBarViewController *)[self parentViewController];
    listVC = ((ListViewController *)[[parentVC viewControllers] objectAtIndex:1]);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationKit:(LocationKit *)locationKit didUpdateLocation:(CLLocation *)location {
    if (location != nil) {
        NSLog(@"%@", location);
    }
    [[LocationKit sharedInstance] getCurrentPlaceWithHandler:^(LKPlace *place, NSError *error) {
        if (error == nil) {
            if (place.address.locality != nil) {
                [listVC addVisitWithPlace:place];
            }
            NSLog(@"The user is in %@", place.address.locality);
        } else {
            NSLog(@"Error fetching place: %@", error);
        }
    }];
}

- (void)locationKit:(LocationKit *)locationKit didStartVisit:(LKVisit *)visit {
    //NSLog(@"%@", [[(TabBarViewController *)[self parentViewController] viewControllers] objectAtIndex:1] );
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
