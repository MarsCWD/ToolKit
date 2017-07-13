//
//  BNXCountDownTool.m
//  BNX
//
//  Created by Chen on 16/4/20.
//  Copyright © 2016年 Huasky. All rights reserved.
//

#import "HHXCountDownTool.h"

@interface HHXCountDownTool ()
@property (nonatomic, strong) dispatch_source_t timer;

@property (nonatomic, copy) NSDate *currentDate;
@property (nonatomic, copy) void (^persecontCallBack)(NSTimeInterval time);
@end

@implementation HHXCountDownTool

- (void)countDownByTime:(NSTimeInterval)countDownTime
   persecontCallBack:(void (^)(NSTimeInterval time))persecontCallBack
       completeCallBack:(void (^)())complete {
    
    self.time = countDownTime;
    self.persecontCallBack = persecontCallBack;
    
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    
    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(self.timer, ^{
        if (self.time <= 0 && complete) {//倒计时结束
            dispatch_async(dispatch_get_main_queue(), ^{
                complete();
                [self cancelCountDown];
            });
        } else {
            self.time --;
            if (persecontCallBack) {//倒计时每秒回调
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.persecontCallBack(self.time);
                });
            }
        }
    });
    dispatch_resume(self.timer);
    
    //这两个通知用于处理应用在后台时的倒计时
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidEnterBackground)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillEnterForeground)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:nil];
}

//进入后台
- (void)applicationDidEnterBackground {
    self.currentDate = [NSDate date];
}

//从后台进入应用
- (void)applicationWillEnterForeground {
    if (self.time == 0) {
        return;
    }
    NSTimeInterval lastTime = [self.currentDate timeIntervalSinceNow];
    
    if (fabs(lastTime) >= self.time) {//订单超时
        self.time = 0;
    } else {
        self.time = self.time - fabs(lastTime);
    }
}

- (void)cancelCountDown {
    if (self.timer) {
        dispatch_source_cancel(self.timer);
        self.timer = nil;
    }
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
