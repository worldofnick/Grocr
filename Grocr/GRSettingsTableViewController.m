//
//  GRSettingsTableViewController.m
//  Grocr
//
//  Created by Nick Porter on 4/26/16.
//  Copyright © 2016 Nick Porter. All rights reserved.
//

#import "GRSettingsTableViewController.h"
#import "GRSettings1TableViewCell.h"
#import "GRSettings2TableViewCell.h"

@interface GRSettingsTableViewController ()

@end

@implementation GRSettingsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self dismissKeyboard];
}

- (void)dismissKeyboard
{
    [self.view endEditing:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 290;
    }
    return 310;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        return [self createCell1:tableView];
    }

    
    return [self createCell2:tableView];
}

#pragma mark - IBAction's

- (IBAction)saveSettings:(id)sender {
    
    GRSettings1TableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    BOOL canSaveSettings = [self IsValidEmail:cell.emailTextField.text] && cell.nameTextField.text.length > 0 && cell.locationTextField.text.length > 0 && [self checkUserName:cell.userNameTextField.text];
    
    if (canSaveSettings && [self saveSettings]) {
        
        [self dismiss:nil];
    }
    
}

- (IBAction)dismiss:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Cell creation

- (UITableViewCell *)createCell1:(UITableView *)tableView
{
    static NSString *CellIdentifier = @"settings1";
    static NSString *CellNib = @"GRSettingsTableViewCell1";
    
    GRSettings1TableViewCell *cell = (GRSettings1TableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:CellNib owner:self options:nil];
        cell = (GRSettings1TableViewCell *)[nib objectAtIndex:0];
    }
    cell.preservesSuperviewLayoutMargins = NO;
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    
    return cell;
}

- (UITableViewCell *)createCell2:(UITableView *)tableView
{
    static NSString *CellIdentifier = @"settings2";
    static NSString *CellNib = @"GRSettingsTableViewCell2";
    
    GRSettings2TableViewCell *cell = (GRSettings2TableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:CellNib owner:self options:nil];
        cell = (GRSettings2TableViewCell *)[nib objectAtIndex:0];
    }
    // Remove cell seperator
    cell.separatorInset = UIEdgeInsetsMake(0, 10000, 0, 0);
    
    return cell;
}

#pragma mark - Valid input checking

- (BOOL) IsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

- (BOOL)checkUserName:(NSString *)userName
{
    // Check if username was changed, if so check if available.
    return NO;
}

- (BOOL)saveSettings
{
    return NO;
}

@end
