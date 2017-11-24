//
//  UIColor+Additions.m
//  商品的布局切换Demo
//
//  Created by bailing on 2017/11/24.
//  Copyright © 2017年 bailing. All rights reserved.
//
#import "UIColor+Additions.h"

@implementation UIColor (Additions)

+ (UIColor *)colorFromHexValue:(NSUInteger)hexValue {
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0f];
}

@end
