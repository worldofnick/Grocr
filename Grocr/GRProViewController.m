//
//  GRProViewController.m
//  Grocr
//
//  Created by Nick Porter on 4/24/16.
//  Copyright © 2016 Nick Porter. All rights reserved.
//

#import "GRProViewController.h"
#import "GRAppearance.h"

@interface GRProViewController ()

@property (nonatomic, strong)UIImageView *bannerImageView;
@property (nonatomic, strong)UIButton *restoreButton;

@end

@implementation GRProViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addBannerImageView];
    [self addRestoreButton];
}

- (void)addBannerImageView
{
    double y = self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height + 10;
    
    _bannerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, y, self.view.frame.size.width, self.view.frame.size.height - y)];
    _bannerImageView.image = [UIImage imageNamed:@"grocrPro"];
    _bannerImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buyPlus)];
    singleTap.numberOfTapsRequired = 1;
    _bannerImageView.userInteractionEnabled = YES;
    [_bannerImageView addGestureRecognizer:singleTap];
    
    [self.view addSubview:_bannerImageView];
}

- (void)addRestoreButton
{
    _restoreButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_restoreButton setTitle:@"Restore Purchase" forState:UIControlStateNormal];
    _restoreButton.tintColor = [GRAppearance grocrPrimaryColor];
    _restoreButton.titleLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
    _restoreButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _restoreButton.frame = CGRectMake(0, self.view.frame.size.height - 32, self.view.frame.size.width, 30);
    [_restoreButton addTarget:self action:@selector(restorePurchase) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_restoreButton];
}

- (void)buyPlus
{
    NSLog(@"Buy plus");
}

- (void)restorePurchase
{
    NSLog(@"Restore purchase");
}

- (IBAction)dismiss:(UIBarButtonItem *)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
