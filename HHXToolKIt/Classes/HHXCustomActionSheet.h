//
//  BNXCustomActionSheet.h
//  BNX
//
//  Created by Chen on 16/5/6.
//  Copyright © 2016年 Huasky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHXCustomActionSheet : UIView

/**
 *  自定义actionSheet
 *
 *  @param titles       除cancel按钮外的title数组，从上到下排列
 *  @param cancelTitle  cancel按钮title
 *  @param selectBlock  按钮选择后的回调
 *  @param dismissBlock view隐藏后的回调
 */
- (void)showActionSheetWithButtonTitles:(NSArray *)titles
                         cancelBtnTitle:(NSString *)cancelTitle
                            selectBlock:(void (^)(NSInteger buttonIndex))selectBlock
                           dismissBlock:(void (^)())dismissBlock;

@end
