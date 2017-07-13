//
//  HHXWebView.m
//  HHXToolKit
//
//  Created by 陈卫东 on 2016/12/30.
//  Copyright © 2016年 陈卫东. All rights reserved.
//

#import "HHXWebView.h"

#import <ReactiveCocoa.h>
#import <Masonry.h>
#import "HHXDefinitions.h"

@interface HHXWebView ()
@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation HHXWebView

- (instancetype)initWithFrame:(CGRect)frame configuration:(WKWebViewConfiguration *)configuration {
    self = [super initWithFrame:frame configuration:configuration];
    if (!self) return nil;

    [self addSubview:self.progressView];
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.equalTo(@3);
    }];

    __weak typeof(self) weakSelf = self;
    [RACObserve(self, estimatedProgress) subscribeNext:^(NSNumber *estimatedProgress) {
        weakSelf.progressView.progress = estimatedProgress.doubleValue;
        weakSelf.progressView.hidden = (estimatedProgress.doubleValue == 1);
    }];
    return self;
}

#pragma mark - getter
- (UIProgressView *)progressView {
    if (!_progressView) {
        _progressView = [[UIProgressView alloc] init];
        _progressView.backgroundColor = [UIColor clearColor];
        _progressView.trackTintColor = [UIColor clearColor];
        _progressView.progressTintColor = HEXColor(0xFBB03B);
    }
    return _progressView;
}

@end
