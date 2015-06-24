//
//  VisitCell.m
//  
//
//  Created by Spencer Atkin on 6/23/15.
//
//

#import "VisitCell.h"

@implementation VisitCell

- (void)setPlace:(LKPlace *)place {
    [_placeLbl setText:[NSString stringWithFormat:@"%@", place.address.locality]];
}

@end
