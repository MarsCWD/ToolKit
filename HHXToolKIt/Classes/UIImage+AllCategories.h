//
//  UIImage+AllCategories.h
//  Categories
//
//  Created by ChenWeidong on 16/2/4.
//  Copyright © 2016年 陈卫东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (AllCategories)

/**
 *  用颜色值填充所设定的区域
 *
 *  @param color 填充的颜色值
 *  @param size  设定的区域
 */
+ (UIImage *)imageWithSolidColor:(UIColor *)color size:(CGSize)size;

/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)imageName;
+ (UIImage *)resizedImageWithName:(NSString *)imageName left:(CGFloat)left top:(CGFloat)top;
+ (UIImage *)resizedImageUseInsetWithName:(NSString *)imageName;

/**
 *  虚线
 *
 *  @param drawSize  虚线范围
 *  @param lineWidth 虚线宽度
 *  @param lineColor 虚线颜色
 */
+ (UIImage *)imageByDashedView:(CGSize)drawSize
                     lineWidth:(CGFloat)lineWidth
                     lineColor:(UIColor *)lineColor;
@end
