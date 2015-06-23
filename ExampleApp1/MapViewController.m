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

- (void)viewDidLoad {
    [super viewDidLoad];
    [_mapView setDelegate:self];
    NSArray *listViewItems = ((ListViewController *)[[TAB_BAR_VC viewControllers] objectAtIndex:1]).items;
    listViewItems = [listViewItems arrayByAddingObject:@"Hello"];
    //[((ListViewController *)[[TAB_BAR_VC viewControllers] objectAtIndex:1]).tableView reloadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationKit:(LocationKit *)locationKit didUpdateLocation:(CLLocation *)location {
    NSLog(@"Update");
    if (location != nil) {
        NSLog(@"%@", location);
    }
    [[LocationKit sharedInstance] getCurrentPlaceWithHandler:^(LKPlace *place, NSError *error) {
        if (error == nil) {
            NSLog(@"The user is in %@", place.address.locality);
        } else {
            NSLog(@"Error fetching place: %@", error);
        }
    }];
}

- (void)locationKit:(LocationKit *)locationKit didStartVisit:(LKVisit *)visit {
    NSLog(@"%@", [[(TabBarViewController *)[self parentViewController] viewControllers] objectAtIndex:1] );
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
