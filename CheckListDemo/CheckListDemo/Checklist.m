//
//  Checklist.m
//  CheckListDemo
//
//  Created by sunydea on 14-3-11.
//  Copyright (c) 2014年 sunydea. All rights reserved.
//

#import "Checklist.h"
#import "CheckItem.h"

@implementation Checklist

- (id)init {
    if ((self = [super init])) {
        self.items = [[NSMutableArray alloc] initWithCapacity:20];
        self.iconName = @"Icon-Small";
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (( self = [super init] )) {
        self.name = [aDecoder decodeObjectForKey:@"Name"];
        self.items = [aDecoder decodeObjectForKey:@"Items"];
        self.iconName = [aDecoder decodeObjectForKey:@"IconName"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"Name"];
    [aCoder encodeObject:self.items forKey:@"Items"];
    [aCoder encodeObject:self.iconName forKey:@"IconName"];
}

- (int)countUncheckedItems {
    int count = 0;
    for (CheckItem *item in self.items) {
        if (!item.checked) {
            count+=1;
        }
    }
    return count;
}

- (NSComparisonResult)compare:(Checklist *)otherChecklist {
    return [self.name localizedStandardCompare:otherChecklist.name];
}

@end
