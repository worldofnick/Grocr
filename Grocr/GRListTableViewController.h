//
//  GRListTableViewController.h
//  Grocr
//
//  Created by Nick Porter on 9/7/15.
//  Copyright © 2015 Nick Porter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIScrollView+EmptyDataSet.h"

@interface GRListTableViewController : UITableViewController <DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@end
