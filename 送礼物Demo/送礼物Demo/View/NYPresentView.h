//
//  NYPresentView.h
//  送礼物Demo
//
//  Created by zhainaiyu on 2016/10/26.
//  Copyright © 2016年 com.znycat.ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NYShakeLabel.h"
#import "NYGiftModel.h"
@interface NYPresentView : UIView
/** 礼物模型*/
@property (nonatomic,strong)NYGiftModel *giftModel;

/** 会缩放动画的UILabel*/
@property (weak, nonatomic) IBOutlet NYShakeLabel *shakeLabel;


@property (nonatomic,strong)NSMutableDictionary<NSString*, NSMutableArray<NYGiftModel *> *> *giftModelsDic;

/** 所有keys*/
@property (nonatomic,strong)NSMutableArray *giftModelskeys;

//开始动画
-(void)startAnima;

/** 整在动画中*/
@property (nonatomic,assign)BOOL isAnimaing;
@end
