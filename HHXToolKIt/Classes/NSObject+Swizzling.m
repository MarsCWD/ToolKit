//
//  NSObject+Swizzling.m
//  MTools
//
//  Created by jack zhou on 7/10/15.
//  Copyright (c) 2015 jack zhou. All rights reserved.
//

#import "NSObject+Swizzling.h"
#import <objc/runtime.h>
@implementation NSObject (Swizzling)
+ (void)swizzlingWithOriginalSEL:(SEL)originalSEL
                          newSEL:(SEL)newSEL
                      defaultSEL:(SEL)defaultSEL
                 targetClassName:(NSString *)targetClassName
{
    Class selfClass = [self class];
    Class targetClass;
    if (targetClassName.length > 0) {
        targetClass = objc_getClass([targetClassName UTF8String]);
    }else {
        targetClass = selfClass;
    }
    NSAssert(targetClass, @"TargetClass NotFound");
    Method oldMethod = nil;
    Method newMethod = nil;
    if (defaultSEL) {
        class_addMethod(targetClass, newSEL, class_getMethodImplementation(selfClass, newSEL),nil);
        class_addMethod(targetClass, originalSEL, class_getMethodImplementation(selfClass, defaultSEL),nil);
        if (class_getInstanceMethod(targetClass, originalSEL) &&
            class_getInstanceMethod(targetClass, newSEL)) {//判断是否是实例方法
            oldMethod = class_getInstanceMethod(targetClass, originalSEL);
            newMethod = class_getInstanceMethod(targetClass, newSEL);
        } else {//类方法
            oldMethod = class_getClassMethod(targetClass, originalSEL);
            newMethod = class_getClassMethod(targetClass, newSEL);
        }
        method_exchangeImplementations(oldMethod, newMethod);
    } else {
        class_addMethod(targetClass, newSEL, class_getMethodImplementation(selfClass, newSEL),nil);

        if (class_getInstanceMethod(targetClass, originalSEL) &&
            class_getInstanceMethod(targetClass, newSEL)) {
            oldMethod = class_getInstanceMethod(targetClass, originalSEL);
            newMethod = class_getInstanceMethod(targetClass, newSEL);
        } else {
            oldMethod = class_getClassMethod(targetClass, originalSEL);
            newMethod = class_getClassMethod(targetClass, newSEL);
        }
        method_exchangeImplementations(oldMethod, newMethod);
    }
}

+ (void)swizzlingWithOriginalSEL:(SEL)originalSEL
                          newSEL:(SEL)newSEL
                 targetClassName:(NSString *)targetClassName
{
    [self swizzlingWithOriginalSEL:originalSEL
                            newSEL:newSEL
                        defaultSEL:nil
                   targetClassName:targetClassName];
}

+ (void)swizzlingWithOriginalSEL:(SEL)originalSEL
                          newSEL:(SEL)newSEL
{
    [self swizzlingWithOriginalSEL:originalSEL
                            newSEL:newSEL
                        defaultSEL:nil
                   targetClassName:nil];
}

@end
