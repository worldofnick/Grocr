//
//  GRSettings2TableViewCell.m
//  Grocr
//
//  Created by Nick Porter on 4/26/16.
//  Copyright © 2016 Nick Porter. All rights reserved.
//

#import "GRSettings2TableViewCell.h"

@implementation GRSettings2TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self configureButton:_notificationButton];
    [self configureButton:_logOutButton];
    [self configureButton:_firstButton];
    [self configureButton:_twitterButton];
    [self configureButton:_facebookButton];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureButton:(UIButton *)button
{
    button.titleLabel.textColor = [UIColor colorWithRed:0.07 green:0.11 blue:0.12 alpha:1.00];
    button.layer.cornerRadius = 3.0f;
    button.clipsToBounds = YES;
}

@end
