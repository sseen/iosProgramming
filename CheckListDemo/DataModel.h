//
//  DataModel.h
//  CheckListDemo
//
//  Created by sunydea on 14-3-12.
//  Copyright (c) 2014年 sunydea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject
@property (nonatomic, strong) NSMutableArray *lists;
- (void)saveChecklists;
- (NSInteger)indexOfSelectedChecklist;
- (void)setIndexOfSelectedChecklist:(NSInteger)index;
- (void)sortChecklists;

@end
