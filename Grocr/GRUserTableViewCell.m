//
//  GRUserTableViewCell.m
//  Grocr
//
//  Created by Nick Porter on 4/26/16.
//  Copyright © 2016 Nick Porter. All rights reserved.
//

#import "GRUserTableViewCell.h"

@implementation GRUserTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _userImageView.layer.cornerRadius = _userImageView.frame.size.width / 2;
    _userImageView.clipsToBounds = YES;
    
    [self configureButton:_goProButton];
    [self configureButton:_settingsButton];
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
