//
//  GRActivityTableViewCell.m
//  Grocr
//
//  Created by Nick Porter on 9/7/15.
//  Copyright © 2015 Nick Porter. All rights reserved.
//

#import "GRActivityTableViewCell.h"
#import "GRAppearance.h"

@implementation GRActivityTableViewCell

- (void)awakeFromNib {
    // Round profile picture
    _profilePictureImageView.layer.cornerRadius = _profilePictureImageView.frame.size.width / 2;
    _profilePictureImageView.clipsToBounds = YES;
    
    _notificationCircleView.layer.cornerRadius = _notificationCircleView.frame.size.width / 2;
    _notificationCircleView.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureCellWithActivityType:(GRActivityType)type
{
    _activityType = type;
    if (_activityType == kInvite) {
        [self addAcceptButton];
    }
}

- (void)addAcceptButton
{
    NSAttributedString *title = [[NSAttributedString alloc]initWithString:@"ACCEPT"];
    UIButton *button = [GRAppearance grocrButtonWithFrame:CGRectMake(0, 0, 75, 30) andTitle:title];
    button.center = self.contentView.center;
    button.frame = CGRectMake(button.frame.origin.x + 22, button.frame.origin.y, 75, 30);
    
    [button addTarget:self action:@selector(acceptInvite) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:button];
}

- (void)acceptInvite
{
    NSLog(@"Accept Invite");
}

@end
