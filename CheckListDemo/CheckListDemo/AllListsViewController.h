//
//  AllListsViewController.h
//  CheckListDemo
//
//  Created by sunydea on 14-3-11.
//  Copyright (c) 2014年 sunydea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListDetailViewController.h"
@class DataModel;

@interface AllListsViewController : UITableViewController <ListDetailViewControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) DataModel *dataModel;
@end
