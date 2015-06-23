//
//  VisitCell.m
//  
//
//  Created by Spencer Atkin on 6/23/15.
//
//

#import "VisitCell.h"

@implementation VisitCell

- (void)initWithPlace:(LKPlace *)place {
    _placeLbl.text = place.address.locality;
}

@end
