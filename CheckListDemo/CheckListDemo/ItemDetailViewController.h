//
//  AddItemViewController.h
//  CheckListDemo
//
//  Created by sunydea on 14-3-7.
//  Copyright (c) 2014年 sunydea. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ItemDetailViewController;
@class CheckItem;

@protocol ItemDetailViewControllerDelegate <NSObject>

- (void)ItemDetailViewControllerDidCancel:(ItemDetailViewController *)controller;
- (void)ItemDetailViewController:(ItemDetailViewController *)controller didFinishAddingItem:(CheckItem *)item;
- (void)ItemDetailViewController:(ItemDetailViewController *)controller didFinishEditingItem:(CheckItem *)item;

@end

@interface ItemDetailViewController : UITableViewController <UITextFieldDelegate>

@property (nonatomic, weak) id <ItemDetailViewControllerDelegate> delegate;
@property (nonatomic, strong) CheckItem *itemToEdit;

@end
