//
//  GRActivityTableViewController.m
//  Grocr
//
//  Created by Nick Porter on 9/7/15.
//  Copyright © 2015 Nick Porter. All rights reserved.
//

#import "GRActivityTableViewController.h"
#import "GRActivityTableViewCell.h"

@interface GRActivityTableViewController ()

@end

@implementation GRActivityTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.95 green:0.96 blue:0.97 alpha:1];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.tabBarItem.badgeValue = 0;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"activityTableViewCell";
    GRActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (!cell) {
        cell = [[GRActivityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    // Dummy data
    if (indexPath.row == 1) {
        cell.nameLabel.text = @"Nick Porter";
        cell.activityDetailsLabel.text = @"Arrived at Target.";
        cell.timeLabel.text = @"42 minutes ago";
        cell.profilePictureImageView.image = [UIImage imageNamed:@"nick"];
        [cell configureCellWithActivityType:kArrival];
    }
    if (indexPath.row == 2) {
        cell.nameLabel.text = @"Nick Porter";
        cell.activityDetailsLabel.text = @"Accepted your invite.";
        cell.timeLabel.text = @"50 minutes ago";
        cell.profilePictureImageView.image = [UIImage imageNamed:@"nick"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell configureCellWithActivityType:kAccept];
        cell.notificationCircleView.hidden = YES;
    }
    
    if (indexPath.row == 0) {
        [cell configureCellWithActivityType:kInvite];
    }
    
    return cell;
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
