//
//  CheckItem.h
//  CheckListDemo
//
//  Created by sunydea on 14-3-7.
//  Copyright (c) 2014年 sunydea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CheckItem : NSObject <NSCoding>
@property (nonatomic, copy) NSString *text;
@property (nonatomic) BOOL checked;

@end
