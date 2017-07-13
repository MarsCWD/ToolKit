//
//  UIViewController+AllCategories.h
//  Categories
//
//  Created by ChenWeidong on 16/2/4.
//  Copyright © 2016年 陈卫东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (AllCategories)

/**
 *  获取根控制器
 */
+ (UIViewController *)topViewController;

/**
 *  清理导航堆栈，默认只剩下firstVC和lastVC
 */
- (void)cleanNavigationStack;

- (BOOL)isPresentJump;

@end
