//
//  GRUserTableViewController.m
//  Grocr
//
//  Created by Nick Porter on 4/26/16.
//  Copyright © 2016 Nick Porter. All rights reserved.
//

#import "GRUserTableViewController.h"
#import "GRUserTableViewCell.h"

@interface GRUserTableViewController ()

@end

@implementation GRUserTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.94 green:0.95 blue:0.95 alpha:1.00];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 355;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"user";
    static NSString *CellNib = @"GRUserTableViewCell";
    
    GRUserTableViewCell *cell = (GRUserTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:CellNib owner:self options:nil];
        cell = (GRUserTableViewCell *)[nib objectAtIndex:0];
    }
    cell.preservesSuperviewLayoutMargins = NO;
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    
    [cell.goProButton addTarget:self action:@selector(presentProView) forControlEvents:UIControlEventTouchUpInside];
    [cell.settingsButton addTarget:self action:@selector(presentSettings) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
    
}

#pragma mark - Presenting

- (void)presentProView
{
    self.navigationController.view.backgroundColor = [UIColor whiteColor];
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"proNC"];
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}

- (void)presentSettings
{
    self.navigationController.view.backgroundColor = [UIColor whiteColor];
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"settingsNC"];
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}

@end
