//
//  BNXCountDownTool.h
//  BNX
//
//  Created by Chen on 16/4/20.
//  Copyright © 2016年 Huasky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HHXCountDownTool : NSObject

/**
 *  倒计时剩余时间
 */
@property (nonatomic, assign) NSTimeInterval time;

/**
 *  倒计时
 *
 *  @param countDownTime     倒计时时间 单位秒
 *  @param persecontCallBack 每秒回调
 *  @param complete          倒计时结束回调
 */
- (void)countDownByTime:(NSTimeInterval)countDownTime
      persecontCallBack:(void (^)(NSTimeInterval time))persecontCallBack
       completeCallBack:(void (^)())complete;

/**
 *  倒计时取消
 */
- (void)cancelCountDown;
@end
