//
//  NYGiftMainView.h
//  送礼物Demo
//
//  Created by zhainaiyu on 2016/10/27.
//  Copyright © 2016年 com.znycat.ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NYGiftModel.h"
@interface NYGiftMainView : UIView


/** giftModel字典
    模型的一个字典，
    其中
        key 是model的giftKeyID;//唯一标示礼物的ID key
        value 对应的是模型数组
        @{  model.giftKeyID : @[model,model,model],
            model.giftKeyID : @[model,model,model],
        }
 
    每次执行动画时候从这个字典中根据当前presentView显示的礼物模型的key取出模型数组，然后执行动画
 */
//@property (nonatomic,strong)NSMutableDictionary<NSString*, NSMutableArray<NYGiftModel *> *> *giftModelsDic;
//
///** 所有keys*/
//@property (nonatomic,strong)NSMutableArray *giftModelskeys;



-(void)addModel:(NYGiftModel *)model;
@end
