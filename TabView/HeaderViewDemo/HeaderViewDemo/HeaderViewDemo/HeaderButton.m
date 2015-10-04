//
//  HeaderButton.m
//  HeaderViewDemo
//
//  Created by Rannie on 13-9-8.
//  Copyright (c) 2013年 Rannie. All rights reserved.
//

#import "HeaderButton.h"

#define RMarginX 5
#define RMarginY 15
#define RIconSide 20
#define ROffsetY 5.0f

@implementation HeaderButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImage *image = [UIImage imageNamed:@"arrow-right"];
        [self setImage:image forState:UIControlStateNormal];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        //[self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _open = NO;
    }
    return self;
}

- (void)setOpen:(BOOL)open
{
    _open = open;
    //设定点击旋转动画效果
    [UIView beginAnimations:nil context:nil];
    self.imageView.transform = CGAffineTransformMakeRotation(self.isOpen?M_PI_2:0);
    [UIView commitAnimations];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    CGContextSetStrokeColorWithColor(context, [UIColor darkGrayColor].CGColor);
    CGContextMoveToPoint(context, 0, rect.size.height);
    CGContextAddLineToPoint(context, 320, rect.size.height);
    CGContextSetLineWidth(context, 2.0f);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    UIColor *light = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.1];
    UIColor *dark = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.35];
    NSArray *colors = @[(__bridge id)light.CGColor, (__bridge id)dark.CGColor];
    CGFloat locations[] = {0.0, 1.0};
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);
    
    CGContextSaveGState(context);
    CGPoint start = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint end = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    CGContextDrawLinearGradient(context, gradient, start, end, 0);
    
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    
//    CGColorSpaceRef offColorSpace = CGColorSpaceCreateDeviceRGB();
//    UIColor *lightOffset = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.35];
//    UIColor *darkOffset = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.1];
//    NSArray *offsetColors = @[(__bridge id)lightOffset.CGColor, (__bridge id)darkOffset.CGColor];
//    CGFloat offsetLoactions[] = {0.0, 1.0};
//    
//    CGGradientRef offsetGradient = CGGradientCreateWithColors(offColorSpace, (__bridge CFArrayRef)offsetColors, offsetLoactions);
//    CGContextSaveGState(context);
//    CGPoint offStart = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
//    CGPoint offEnd = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect)+ROffsetY*2);
//    CGContextDrawLinearGradient(context, offsetGradient, offStart, offEnd, 0);
//    
//    CGGradientRelease(offsetGradient);
//    CGColorSpaceRelease(colorSpace);
//    CGContextRestoreGState(context);
}

//图像显示位置
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(RMarginX, RMarginY, RIconSide, RIconSide);
}

//标题显示位置
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(RIconSide + 4*RMarginX, 0, contentRect.size.width, contentRect.size.height);
}

@end
