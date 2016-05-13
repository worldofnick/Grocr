//
//  GRRequests.h
//  Grocr
//
//  Created by Nick Porter on 5/12/16.
//  Copyright © 2016 Nick Porter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface GRRequests : NSObject

+ (BOOL)registerUserWithPFUser:(PFUser *)user;

+ (BOOL)doesUserExistWithEmail:(NSString *)email;

+ (BOOL)doesUserExistWithUsername:(NSString *)username;

@end
