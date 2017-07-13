//
//  BNXCustomActionSheet.m
//  BNX
//
//  Created by Chen on 16/5/6.
//  Copyright © 2016年 Huasky. All rights reserved.
//

#import "HHXCustomActionSheet.h"
#import "HHXActionSheetButton.h"

#import "HHXDefinitions.h"
#import "UIView+Layout.h"
#import <ReactiveCocoa.h>

@interface HHXCustomActionSheet ()
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;

@property (nonatomic, copy) void (^dismissCompleteBlock)(void);
@property (nonatomic, copy) void (^selectCompleteBlock)(NSInteger buttonIndex);
@end

@implementation HHXCustomActionSheet

- (instancetype)init {
    return [self initWithFrame:[UIScreen mainScreen].bounds];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
        [self addGestureRecognizer:self.tapGesture];
        
        [self addSubview:self.containerView];
    }
    return self;
}

- (void)showActionSheetWithButtonTitles:(NSArray *)titles
                         cancelBtnTitle:(NSString *)cancelTitle
                            selectBlock:(void (^)(NSInteger buttonIndex))selectBlock
                           dismissBlock:(void (^)())dismissBlock {
    
    _selectCompleteBlock = selectBlock;
    _dismissCompleteBlock = dismissBlock;

    CGFloat kButtonHeight = kRatio(49);
    
    self.containerView.height = titles.count * kButtonHeight + 8 + kButtonHeight;
    
    @weakify(self);
    for (int i = 0; i < titles.count; i ++) {
        HHXActionSheetButton *button = [[HHXActionSheetButton alloc] initWithFrame:CGRectMake(0, 0 + i * kButtonHeight, self.containerView.width, kButtonHeight)];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.tag = i;
        [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *sender) {
            @strongify(self);
            if (self.selectCompleteBlock) {
                self.selectCompleteBlock(sender.tag);
            }
            [self dismissActionSheet];
        }];
        [self.containerView addSubview:button];

        UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, button.bottom - OnePixelLineWidth, self.containerView.width, OnePixelLineWidth)];
        bottomLine.backgroundColor = App_Line_Color;
        [self.containerView addSubview:bottomLine];
    }
    
    HHXActionSheetButton *cancelButton = [[HHXActionSheetButton alloc] initWithFrame:CGRectMake(0, self.containerView.height - kButtonHeight, self.containerView.width, kButtonHeight)];
    [cancelButton setTitle:cancelTitle forState:UIControlStateNormal];
    [[cancelButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *sender) {
        @strongify(self);
        [self dismissActionSheet];
    }];
    [self.containerView addSubview:cancelButton];
    
    [self showActionSheet];
}

- (void)tapView:(UIGestureRecognizer *)gesuture {
    CGFloat tapY = [gesuture locationInView:self].y;
    if (tapY < self.containerView.top) {
        [self dismissActionSheet];
    }
}

- (void)showActionSheet {
    [UIView animateWithDuration:0.25 animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        self.containerView.top = self.height - self.containerView.height;
    } completion:^(BOOL finished) {
    }];
}

- (void)dismissActionSheet {
    [UIView animateWithDuration:0.25 animations:^{
        self.backgroundColor = [UIColor clearColor];
        self.containerView.top = self.height;
    } completion:^(BOOL finished) {
        if (self.dismissCompleteBlock) {
            [self removeGestureRecognizer:self.tapGesture];
            self.dismissCompleteBlock();
        }
    }];
}

#pragma mark - getter
- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height, self.width, 0)];
        _containerView.backgroundColor = [UIColor lightGrayColor];
    }
    return _containerView;
}
@end
