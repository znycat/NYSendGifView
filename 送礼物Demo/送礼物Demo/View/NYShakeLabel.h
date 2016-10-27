//
//  NYShakeLabel.h
//  送礼物Demo
//
//  Created by zhainaiyu on 2016/10/26.
//  Copyright © 2016年 com.znycat.ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NYShakeLabel : UILabel
// 动画时间
@property (nonatomic,assign) NSTimeInterval duration;
// 描边颜色
@property (nonatomic,strong) UIColor *borderColor;

- (void)startAnimWithDuration:(NSTimeInterval)duration completion:(void (^ __nullable)(BOOL finished)) completion;
@end
