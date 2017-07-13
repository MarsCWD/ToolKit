//
//  UIViewController+AllCategories.m
//  Categories
//
//  Created by ChenWeidong on 16/2/4.
//  Copyright © 2016年 陈卫东. All rights reserved.
//

#import "UIViewController+AllCategories.h"

@implementation UIViewController (AllCategories)

+ (UIViewController *)topViewController {
    return [self topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

+ (UIViewController *)topViewControllerWithRootViewController:(UIViewController *)rootViewController {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController*)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController *presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}

- (void)cleanNavigationStack {
    NSArray *viewControllers = self.navigationController.navigationController.viewControllers;
    if (viewControllers) {
        self.navigationController.navigationController.viewControllers = @[ viewControllers.firstObject, viewControllers.lastObject ];
    }
}

- (BOOL)isPresentJump {
    NSArray *viewcontrollers=self.navigationController.viewControllers;
    if (viewcontrollers.count > 1) {
        if ([viewcontrollers objectAtIndex:viewcontrollers.count - 1] == self) {
            //push方式
            return NO;
        }
        return NO;
    } else {
        //present方式
        return YES;
    }
}

@end
