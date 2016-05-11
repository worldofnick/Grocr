//
//  GRAppearance.m
//  Grocr
//
//  Created by Nick Porter on 4/24/16.
//  Copyright © 2016 Nick Porter. All rights reserved.
//

#import "GRAppearance.h"

@implementation GRAppearance

+ (UIColor *)grocrPrimaryColor
{
    return [UIColor colorWithRed:1 green:0.17 blue:0.33 alpha:1];
}

+ (UIButton *)grocrButtonWithFrame:(CGRect)frame andTitle:(NSAttributedString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.backgroundColor = [UIColor colorWithRed:0.94 green:0.95 blue:0.95 alpha:1.00];
    button.titleLabel.textColor = [UIColor colorWithRed:0.07 green:0.11 blue:0.12 alpha:1.00];
    [button setAttributedTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
    button.layer.cornerRadius = 3.0f;
    button.clipsToBounds = YES;
    button.frame = frame;
    return button;
}

+ (UIButton *)grocrSwitchWithFrame:(CGRect)frame
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setBackgroundImage:[UIImage imageNamed:@"off"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"on"] forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage imageNamed:@"on"] forState:UIControlStateSelected | UIControlStateHighlighted];
    button.adjustsImageWhenHighlighted = NO;
    return button;
}

@end
