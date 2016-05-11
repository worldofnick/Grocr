//
//  GRSettings2TableViewCell.h
//  Grocr
//
//  Created by Nick Porter on 4/26/16.
//  Copyright © 2016 Nick Porter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRSettings2TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *notificationButton;
@property (weak, nonatomic) IBOutlet UIButton *logOutButton;
@property (weak, nonatomic) IBOutlet UIButton *twitterButton;
@property (weak, nonatomic) IBOutlet UIButton *firstButton;
@property (weak, nonatomic) IBOutlet UIButton *facebookButton;
@end
