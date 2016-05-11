//
//  GRActivityTableViewCell.h
//  Grocr
//
//  Created by Nick Porter on 9/7/15.
//  Copyright © 2015 Nick Porter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRActivityTableViewCell : UITableViewCell

typedef enum GRActivityType : NSUInteger{
    kInvite,
    kArrival,
    kAccept,
    kItemAdded
} GRActivityType;

@property (weak, nonatomic) IBOutlet UIImageView *profilePictureImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *activityDetailsLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (nonatomic)GRActivityType activityType;
@property (weak, nonatomic) IBOutlet UIView *notificationCircleView;

- (void)configureCellWithActivityType:(GRActivityType)type;

@end
