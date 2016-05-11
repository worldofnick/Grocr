//
//  GRSettings1TableViewCell.h
//  Grocr
//
//  Created by Nick Porter on 5/5/16.
//  Copyright © 2016 Nick Porter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRSettings1TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;


@end
