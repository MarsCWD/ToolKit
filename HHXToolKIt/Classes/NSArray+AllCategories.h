//
//  NSArray+AllCategories.h
//  Categories
//
//  Created by ChenWeidong on 16/2/4.
//  Copyright © 2016年 陈卫东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (AllCategories)

/**
 *  过滤数组内的值
 *
 *  @param block 返回BOOL值的block,里面包含过滤条件
 */
- (NSArray *)arrayByFilter:(BOOL (^)(id object))block;

/**
 *  修改数组内的值
 *
 *  @param block 返回id类型的值的block,里面包含所需修改的操作
 */
- (NSArray *)arrayByMap:(id (^)(id object))block;
@end
