//
//  IconPickerViewController.h
//  CheckListDemo
//
//  Created by sunydea on 14-3-14.
//  Copyright (c) 2014年 sunydea. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IconPickerViewController;

@protocol IconPickerViewControllerDelegate <NSObject>

- (void)iconPicker:(IconPickerViewController *)picker didPickIcon:(NSString *)iconName;

@end

@interface IconPickerViewController : UITableViewController
@property (nonatomic, weak)id <IconPickerViewControllerDelegate> delegate;
@end
