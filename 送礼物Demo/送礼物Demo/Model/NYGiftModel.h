//
//  NYGiftModel.h
//  送礼物Demo
//
//  Created by zhainaiyu on 2016/10/27.
//  Copyright © 2016年 com.znycat.ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NYGiftModel : NSObject
@property (nonatomic,strong) UIImage *headImage; // 头像图片
@property (nonatomic,strong) UIImage *giftImage; // 礼物图片
@property (nonatomic,copy) NSString *name; // 送礼物者
@property (nonatomic,copy) NSString *giftName; // 礼物名称
@property (nonatomic,copy) NSString *giftKeyID;//唯一标示礼物的ID key
@end
