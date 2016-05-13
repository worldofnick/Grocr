//
//  GRSignUpViewController.m
//  Grocr
//
//  Created by Nick Porter on 5/11/16.
//  Copyright © 2016 Nick Porter. All rights reserved.
//

#import "GRSignUpViewController.h"
#import "GRRequests.h"

@interface GRSignUpViewController ()

@property (weak, nonatomic) IBOutlet UIButton *goButton;
@property (weak, nonatomic) IBOutlet UITextField *fullNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;

@end

@implementation GRSignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Dismiss keyboard on tap
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    [self initUI];
}

- (void)initUI
{
    _goButton.imageView.contentMode = UIViewContentModeScaleAspectFit;

}

-(void)dismissKeyboard {
    [self.view endEditing:YES];
}

- (IBAction)goToLoginView {
    NSLog(@"Already a memeber");
}

- (IBAction)goButtonTapped {
    if([self textFieldsAreValid]) {
        // All valid inputs, create user.
    }
}

#pragma mark - Parse Login



#pragma mark - Helper methods

- (BOOL)textFieldsAreValid
{
    return [self validName] && [self validEmail] && [self validPassword] && [self validUsername];
}

- (BOOL)validName
{
    if (_fullNameTextField.text.length > 0 && _fullNameTextField.text.length < 50) {
        return YES;
    }
    [self showErrorAlertWithMessage:@"Please enter your full name"];
    return NO;
}

- (BOOL)validEmail
{
    if([GRRequests doesUserExistWithEmail:_emailTextField.text]) {
        [self showErrorAlertWithMessage:[NSString stringWithFormat:@"%@ is already associated with a current user", _emailTextField.text]];
        return NO;
    }
    
    
    if(_emailTextField.text.length > 50) {
        [self showErrorAlertWithMessage:@"WHY IS YOUR EMAIL SO LONG?"];
        return NO;
    }
    
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:_emailTextField.text];
}

- (BOOL)validPassword
{
    
    if(_passwordTextField.text.length > 50) {
        [self showErrorAlertWithMessage:@"WE UNDERSTAND YOUR SECURITY IS IMPORTANT, BUT YOUR PASSWORD IS TOO LONG"];
        return NO;
    }
    
    if (_fullNameTextField.text.length > 6) {
        return YES;
    }
    [self showErrorAlertWithMessage:@"Your password must be at least 6 characters"];
    return NO;
}

- (BOOL)validUsername
{
    if(_usernameTextField.text.length > 50) {
        [self showErrorAlertWithMessage:@"YOUR USERNAME IS JUST TOO LONG MAN"];
        return NO;
    }
    
    if ([GRRequests doesUserExistWithUsername:_usernameTextField.text]) {
        [self showErrorAlertWithMessage:[NSString stringWithFormat:@"The username %@ is already registered!", _passwordTextField.text]];
        return NO;
    }
    
    NSMutableCharacterSet *charactersToKeep = [NSMutableCharacterSet alphanumericCharacterSet];
    [charactersToKeep addCharactersInString:@"abcdefghijklmnopqrstuvwxyz._-"];
    
    NSCharacterSet *charactersToRemove = [charactersToKeep invertedSet];
    
    NSString *trimmedReplacement = [[ _usernameTextField.text componentsSeparatedByCharactersInSet:charactersToRemove] componentsJoinedByString:@"" ];
    
    if (_usernameTextField.text.length != trimmedReplacement.length) {
        [self showErrorAlertWithMessage:@"Your username may only contain letters, dots, underscores, and dashes"];
    }
    
    return _usernameTextField.text.length == trimmedReplacement.length;
}

- (void)showErrorAlertWithMessage:(NSString *)message
{
    // display an alert with the error message
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Registration"
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
