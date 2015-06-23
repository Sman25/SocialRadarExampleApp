//
//  VisitCell.h
//  
//
//  Created by Spencer Atkin on 6/23/15.
//
//

#import <UIKit/UIKit.h>

#import <LocationKit/LocationKit.h>

@interface VisitCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *placeLbl;

- (void)initWithPlace:(LKPlace *)place;

@end
