//
//  ViewController.h
//  CheckListDemo
//
//  Created by sunydea on 14-3-6.
//  Copyright (c) 2014年 sunydea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"
@class Checklist;

@interface ViewController : UITableViewController <ItemDetailViewControllerDelegate>

@property (nonatomic, strong)Checklist *checlist;

@end
