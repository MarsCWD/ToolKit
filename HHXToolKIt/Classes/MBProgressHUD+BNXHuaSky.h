//
//  MBProgressHUD+BNXHuaSky.h
//  BNX
//
//  Created by Chen on 16/4/19.
//  Copyright © 2016年 Huasky. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (BNXHuaSky)

+ (void)showSuccess:(NSString *)success;
+ (void)showSuccess:(NSString *)success complete:(void (^)(void))complete;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view complete:(void (^)(void))complete;

+ (void)showError:(NSString *)error;
+ (void)showError:(NSString *)error complete:(void (^)(void))complete;
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view complete:(void (^)(void))complete;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;
+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end
