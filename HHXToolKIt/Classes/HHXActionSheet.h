//
//  BNXActionSheet.h
//  BNX
//
//  Created by Chen on 16/4/22.
//  Copyright © 2016年 Huasky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HHXActionSheet : NSObject

/**
 *  actionSheet
 *
 *  @param vc              显示该actionSheet的VC
 *  @param title           actionsheet的title
 *  @param message         actionSheet的message
 *  @param buttonTitles    actionSheet的buttonTitles， 从上到下显示
 *  @param completionBlock 点击button后的回调
 */
+ (void)actionSheetShowInViewController:(UIViewController *)vc
                                  title:(NSString *)title
                                message:(NSString *)message
                           buttonTitles:(NSArray *)buttonTitles
                        completionBlock:(void (^)(NSInteger buttonIndex))completionBlock;

@end
