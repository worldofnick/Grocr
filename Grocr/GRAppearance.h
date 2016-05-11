//
//  GRAppearance.h
//  Grocr
//
//  Created by Nick Porter on 4/24/16.
//  Copyright © 2016 Nick Porter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GRAppearance : NSObject

+ (UIColor *)grocrPrimaryColor;

+ (UIButton *)grocrButtonWithFrame:(CGRect)frame andTitle:(NSAttributedString *)title;

+ (UIButton *)grocrSwitchWithFrame:(CGRect)frame;

@end
