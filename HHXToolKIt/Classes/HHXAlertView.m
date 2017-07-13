//
//  BNXAlertView.m
//  BNX
//
//  Created by Chen on 16/4/22.
//  Copyright © 2016年 Huasky. All rights reserved.
//

#import "HHXAlertView.h"

#import <ReactiveCocoa.h>

@interface HHXAlertView ()
@end

@implementation HHXAlertView

+ (void)alertViewShowInViewController:(UIViewController *)vc
                                title:(NSString *)title
                              message:(NSString *)message
                         buttonTitles:(NSArray *)buttonTitles
                      completionBlock:(void (^)(NSInteger buttonIndex))completionBlock {
    
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 8.0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        for (NSInteger i = 0; i < buttonTitles.count; i++) {
            UIAlertAction* action = [UIAlertAction actionWithTitle:buttonTitles[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                if (completionBlock) {
                    completionBlock(i);
                }
            }];
            [alertController addAction:action];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [vc presentViewController:alertController animated:YES completion:nil];
        });
    } else {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
        for (NSString *key in buttonTitles) {
            [alertView addButtonWithTitle:key];
        }
        
        [[alertView rac_buttonClickedSignal] subscribeNext:^(NSNumber *buttonIndex) {
            if (completionBlock) {
                completionBlock(buttonIndex.integerValue);
            }
        }];
        [alertView show];
    }
}

@end
