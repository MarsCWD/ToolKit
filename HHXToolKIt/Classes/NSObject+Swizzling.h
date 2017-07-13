//
//  NSObject+Swizzling.h
//  MTools
//
//  Created by jack zhou on 7/10/15.
//  Copyright (c) 2015 jack zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzling)
+ (void)swizzlingWithOriginalSEL:(SEL)originalSEL
                          newSEL:(SEL)newSEL;

+ (void)swizzlingWithOriginalSEL:(SEL)originalSEL
                          newSEL:(SEL)newSEL
                 targetClassName:(NSString *)targetClassName;

+ (void)swizzlingWithOriginalSEL:(SEL)originalSEL
                          newSEL:(SEL)newSEL
                      defaultSEL:(SEL)defaultSEL
                 targetClassName:(NSString *)targetClassName;
@end
