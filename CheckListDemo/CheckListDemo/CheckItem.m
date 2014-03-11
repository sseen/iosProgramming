//
//  CheckItem.m
//  CheckListDemo
//
//  Created by sunydea on 14-3-7.
//  Copyright (c) 2014年 sunydea. All rights reserved.
//

#import "CheckItem.h"

@implementation CheckItem

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.text forKey:@"Text"];
    [aCoder encodeBool:self.checked forKey:@"Checked"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super init])) {
        self.text = [aDecoder decodeObjectForKey:@"Text"];
        self.checked = [aDecoder decodeBoolForKey:@"Checked"];
    }
    return self;
}
@end
