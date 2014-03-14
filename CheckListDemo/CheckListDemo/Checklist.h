//
//  Checklist.h
//  CheckListDemo
//
//  Created by sunydea on 14-3-11.
//  Copyright (c) 2014年 sunydea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Checklist : NSObject <NSCoding>
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *iconName;

- (int)countUncheckedItems;
@end
