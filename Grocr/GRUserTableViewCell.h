//
//  GRUserTableViewCell.h
//  Grocr
//
//  Created by Nick Porter on 4/26/16.
//  Copyright © 2016 Nick Porter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRUserTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *listCountLabel;

@property (weak, nonatomic) IBOutlet UIButton *goProButton;
@property (weak, nonatomic) IBOutlet UIButton *settingsButton;

@end
