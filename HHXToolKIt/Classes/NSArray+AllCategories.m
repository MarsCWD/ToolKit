//
//  NSArray+AllCategories.m
//  Categories
//
//  Created by ChenWeidong on 16/2/4.
//  Copyright © 2016年 陈卫东. All rights reserved.
//

#import "NSArray+AllCategories.h"

@implementation NSArray (AllCategories)

- (NSArray *)arrayByFilter:(BOOL (^)(id object))block {
    if (!block) {
        return self;
    }
    
    __block NSMutableArray *tempArray = @[].mutableCopy;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (block(obj)) {
            [tempArray addObject:obj];
        }
    }];
    
    return tempArray.copy;
}

- (NSArray *)arrayByMap:(id (^)(id object))block {
    if (!block) {
        return self;
    }
    
    __block NSMutableArray *tempArray = @[].mutableCopy;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id object = block(obj);
        if (object && ![object isKindOfClass:[NSNull class]]) {
            [tempArray addObject:object];
        }
    }];
    
    return tempArray.copy;
}

@end
