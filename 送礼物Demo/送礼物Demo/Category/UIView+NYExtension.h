//
//  UIView+NYExtension.h
//  猫猫
//
//  Created by zhainaiyu on 14/5/18.
//  Copyright © 2014年 com.znycat.ios. All rights reserved.
//

#pragma mark - 5.自定义高效率的 NSLog
#ifdef DEBUG
#define NYLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define NYLog(...)
#endif

#define NYLogFunc NYLog(@"");

#import <UIKit/UIKit.h>

@interface UIView (NYExtension)
@property (nonatomic, assign) CGSize ny_size;
@property (nonatomic, assign) CGFloat ny_width;
@property (nonatomic, assign) CGFloat ny_height;
@property (nonatomic, assign) CGFloat ny_x;
@property (nonatomic, assign) CGFloat ny_y;
@property (nonatomic, assign) CGFloat ny_centerX;
@property (nonatomic, assign) CGFloat ny_centerY;
@property (nonatomic, assign) CGFloat ny_max_x;
@property (nonatomic, assign) CGFloat ny_max_y;

/**
 * 判断一个控件是否真正显示在主窗口
 */
- (BOOL)isShowingOnKeyWindow;

//- (CGFloat)x;
//- (void)setX:(CGFloat)x;
/** 在分类中声明@property, 只会生成方法的声明, 不会生成方法的实现和带有_下划线的成员变量*/
/**
 * 判断一个控件是否真正全部显示（包含）在主窗口
 */
- (BOOL)isShowingOnContainsKeyWindow;
/**
 *  根据自己的名字从xib生成view
 *
 *  @return instancetype
 */
+ (instancetype)viewFromXib;




@end
