//
//  BNXActionSheetButton.m
//  BNX
//
//  Created by Chen on 16/5/6.
//  Copyright © 2016年 Huasky. All rights reserved.
//

#import "HHXActionSheetButton.h"

#import "HHXDefinitions.h"
#import "UIView+Layout.h"
#import "UIImage+AllCategories.h"

@implementation HHXActionSheetButton

- (instancetype)init {
    return [self initWithFrame:CGRectMake(0, 0, self.superview.width, kRatio(45))];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.exclusiveTouch = YES;
        [self setTitleColor:Import_Text_Color forState:UIControlStateNormal];

        self.titleLabel.font = Font(18);
        
        [self setBackgroundImage:[UIImage imageWithSolidColor:[UIColor whiteColor] size:CGSizeMake(self.width, self.height)] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageWithSolidColor:[App_Line_Color colorWithAlphaComponent:0.9] size:CGSizeMake(self.width, self.height)] forState:UIControlStateHighlighted];
    }
    return self;
}

@end
