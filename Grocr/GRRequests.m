//
//  GRRequests.m
//  Grocr
//
//  Created by Nick Porter on 5/12/16.
//  Copyright © 2016 Nick Porter. All rights reserved.
//

#import "GRRequests.h"

@implementation GRRequests


// Returns YES if a user is already registered with username
+ (BOOL)doesUserExistWithUsername:(NSString *)username
{
    PFQuery *query = [PFUser query];
    [query whereKey:@"username" equalTo:username];
    
    return query.countObjects > 0;
}

// Returns YES if a user is already registered with email
+ (BOOL)doesUserExistWithEmail:(NSString *)email
{
    PFQuery *query = [PFUser query];
    [query whereKey:@"email" equalTo:email];
    
    return query.countObjects > 0;
}


@end
