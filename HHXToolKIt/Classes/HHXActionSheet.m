//
//  BNXActionSheet.m
//  BNX
//
//  Created by Chen on 16/4/22.
//  Copyright © 2016年 Huasky. All rights reserved.
//

#import "HHXActionSheet.h"

#import <ReactiveCocoa.h>

@interface HHXActionSheet ()
@end

@implementation HHXActionSheet

+ (void)actionSheetShowInViewController:(UIViewController *)vc
                                  title:(NSString *)title
                                message:(NSString *)message
                           buttonTitles:(NSArray *)buttonTitles
                        completionBlock:(void (^)(NSInteger))completionBlock {
    
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 8.0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
        
        for (NSInteger i = 0; i < buttonTitles.count; i++) {
            UIAlertAction* action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                if (completionBlock) {
                    completionBlock(i);
                }
            }];
            [alertController addAction:action];
        }
        
        [vc presentViewController:alertController animated:YES completion:nil];
    } else {
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:title delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
        for (NSString *key in buttonTitles) {
            [sheet addButtonWithTitle:key];
        }
        [[sheet rac_buttonClickedSignal] subscribeNext:^(NSNumber *buttonIndex) {
            if (completionBlock) {
                completionBlock(buttonIndex.integerValue);
            }
        }];
        [sheet showInView:vc.view];
    }
}

@end
