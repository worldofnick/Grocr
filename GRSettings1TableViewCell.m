//
//  GRSettings1TableViewCell.m
//  Grocr
//
//  Created by Nick Porter on 5/5/16.
//  Copyright © 2016 Nick Porter. All rights reserved.
//

#import "GRSettings1TableViewCell.h"

@implementation GRSettings1TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _userImageView.layer.cornerRadius = _userImageView.frame.size.width / 2;
    _userImageView.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
