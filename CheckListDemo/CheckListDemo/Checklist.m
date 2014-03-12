//
//  Checklist.m
//  CheckListDemo
//
//  Created by sunydea on 14-3-11.
//  Copyright (c) 2014年 sunydea. All rights reserved.
//

#import "Checklist.h"

@implementation Checklist

- (id)init {
    if ((self = [super init])) {
        self.items = [[NSMutableArray alloc] initWithCapacity:20];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (( self = [super init] )) {
        self.name = [aDecoder decodeObjectForKey:@"Name"];
        self.items = [aDecoder decodeObjectForKey:@"Items"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"Name"];
    [aCoder encodeObject:self.items forKey:@"Items"];
}

@end
