//
//  UIView+NYExtension.m
//  猫猫
//
//  Created by zhainaiyu on 14/5/18.
//  Copyright © 2014年 com.znycat.ios. All rights reserved.
//

#import "UIView+NYExtension.h"

@implementation UIView (NYExtension)
- (CGSize)ny_size
{
    return self.frame.size;
}

- (void)setNy_size:(CGSize)ny_size
{
    CGRect frame = self.frame;
    frame.size = ny_size;
    self.frame = frame;
}

- (CGFloat)ny_width
{
    return self.frame.size.width;
}

- (CGFloat)ny_height
{
    return self.frame.size.height;
}

- (void)setNy_width:(CGFloat)ny_width
{
    CGRect frame = self.frame;
    frame.size.width = ny_width;
    self.frame = frame;
}

- (void)setNy_height:(CGFloat)ny_height
{
    CGRect frame = self.frame;
    frame.size.height = ny_height;
    self.frame = frame;
}

- (CGFloat)ny_x
{
    return self.frame.origin.x;
}

- (void)setNy_x:(CGFloat)ny_x
{
    CGRect frame = self.frame;
    frame.origin.x = ny_x;
    self.frame = frame;
}

- (CGFloat)ny_y
{
    return self.frame.origin.y;
}

- (void)setNy_y:(CGFloat)ny_y
{
    CGRect frame = self.frame;
    frame.origin.y = ny_y;
    self.frame = frame;
}

- (CGFloat)ny_centerX
{
    return self.center.x;
}

- (void)setNy_centerX:(CGFloat)ny_centerX
{
    CGPoint center = self.center;
    center.x = ny_centerX;
    self.center = center;
}

- (CGFloat)ny_centerY
{
    return self.center.y;
}

- (void)setNy_centerY:(CGFloat)ny_centerY
{
    CGPoint center = self.center;
    center.y = ny_centerY;
    self.center = center;
}

- (CGFloat)ny_max_x
{
    //    return self.ny_x + self.ny_width;
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)ny_max_y
{
    //    return self.ny_y + self.ny_height;
    return CGRectGetMaxY(self.frame);
}

- (void)setNy_max_x:(CGFloat)ny_max_x
{
    self.ny_x = ny_max_x - self.ny_width;
}

- (void)setNy_max_y:(CGFloat)ny_max_y
{
    self.ny_y = ny_max_y - self.ny_height;
}

- (BOOL)isShowingOnKeyWindow
{
    // 主窗口
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    // 以主窗口左上角为坐标原点, 计算self的矩形框
    CGRect newFrame = [keyWindow convertRect:self.frame fromView:self.superview];
    CGRect winBounds = keyWindow.bounds;
    
    // 主窗口的bounds 和 self的矩形框 是否有重叠
    BOOL intersects = CGRectIntersectsRect(newFrame, winBounds);
    
    return !self.isHidden && self.alpha > 0.01 && self.window == keyWindow && intersects;
}

- (BOOL)isShowingOnContainsKeyWindow
{
    // 主窗口
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    // 以主窗口左上角为坐标原点, 计算self的矩形框
    CGRect newFrame = [keyWindow convertRect:self.frame fromView:self.superview];
    CGRect winBounds = keyWindow.bounds;
    
    // 主窗口的bounds 是否包含self
    BOOL intersects = CGRectContainsRect(newFrame, winBounds);
    
    return !self.isHidden && self.alpha > 0.01 && self.window == keyWindow && intersects;
}


+ (instancetype)viewFromXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

@end
