//
//  MBProgressHUD+BNXHuaSky.m
//  BNX
//
//  Created by Chen on 16/4/19.
//  Copyright © 2016年 Huasky. All rights reserved.
//

#import "MBProgressHUD+BNXHuaSky.h"

@implementation MBProgressHUD (BNXHuaSky)

#pragma mark - 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view afterDelay:(NSTimeInterval)delay {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.detailsLabel.text = text;
    hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:icon]];
    [hud hideAnimated:YES afterDelay:delay];
}

#pragma mark - 显示失败信息
+ (void)showError:(NSString *)error {
    [self showError:error toView:nil];
}

+ (void)showError:(NSString *)error complete:(void (^)(void))complete {
    [self showError:error toView:nil complete:complete];
}

+ (void)showError:(NSString *)error toView:(UIView *)view {
    [self showError:error toView:view complete:nil];
}

+ (void)showError:(NSString *)error toView:(UIView *)view complete:(void (^)(void))complete {
//    NSTimeInterval timeInterval = error.length * 0.5 > 2 ? 2 : error.length * 0.5;
    NSTimeInterval timeInterval = 1.5;
    [self show:error icon:@"hhx_hud_error" view:view afterDelay:timeInterval];
    if (complete) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            complete();
        });
    }
}

#pragma mark - 显示成功信息
+ (void)showSuccess:(NSString *)success {
    [self showSuccess:success toView:nil];
}

+ (void)showSuccess:(NSString *)success complete:(void (^)(void))complete {
    [self showSuccess:success toView:nil complete:complete];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view {
    [self showSuccess:success toView:view complete:nil];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view complete:(void (^)(void))complete {
//    NSTimeInterval timeInterval = success.length * 0.15 > 2 ? 2 : success.length * 0.15;
    NSTimeInterval timeInterval = 1.5;
    [self show:success icon:@"hhx_hud_success" view:view afterDelay:timeInterval];
    if (complete) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            complete();
        });
    }
}

#pragma mark - 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.detailsLabel.text = message;
    hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    return hud;
}

+ (MBProgressHUD *)showMessage:(NSString *)message {
    return [self showMessage:message toView:nil];
}

#pragma mark - 隐藏HUD
+ (void)hideHUDForView:(UIView *)view {
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD {
    [self hideHUDForView:[[UIApplication sharedApplication].windows lastObject]];
}

@end
