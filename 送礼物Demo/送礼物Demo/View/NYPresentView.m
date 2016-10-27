//
//  NYPresentView.m
//  送礼物Demo
//
//  Created by zhainaiyu on 2016/10/26.
//  Copyright © 2016年 com.znycat.ios. All rights reserved.
//

#pragma mark - 7.设置 view 圆角和边框
#define NYViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

#import "UIView+NYExtension.h"
#import "NYPresentView.h"
@interface NYPresentView()
/** 头像*/
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
/** 礼物图*/
@property (weak, nonatomic) IBOutlet UIImageView *giftImageView;
/** 送礼人名字*/
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
/** xxx送了一朵奇葩*/
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
/** 灰色背景图*/
@property (weak, nonatomic) IBOutlet UIView *bgView;


/** 记录当前执行到第几个模型了*/
@property (nonatomic,assign)NSUInteger selectedModelIndex;

/** 当前执行的礼物模型*/
@property (nonatomic,strong)NYGiftModel *selectedGiftModel;

@property (nonatomic,strong)dispatch_source_t timer;

/** 倒计时*/
@property (nonatomic,assign)double countDownTime;


@end
@implementation NYPresentView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //初始化
        self.selectedModelIndex = 0;
        self.isAnimaing = NO;
        
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    //设置各种圆角
    NYViewBorderRadius(self.headImageView, 20, 1, [UIColor redColor]);
    NYViewBorderRadius(self.bgView, 20, 0, [UIColor clearColor]);
    self.shakeLabel.borderColor = [UIColor yellowColor];
    
}

-(void)setGiftModel:(NYGiftModel *)giftModel{
    _giftModel = giftModel;
    self.giftImageView.image = giftModel.giftImage;
    self.headImageView.image = giftModel.headImage;
    self.nameLabel.text = giftModel.name;
    self.bottomLabel.text = [NSString stringWithFormat:@"送了%@",giftModel.giftName];
    
    
}

-(void)hiddenPresentView{
    
    
    if (self.giftModelsDic[self.selectedGiftModel.giftKeyID].count > self.selectedModelIndex) {
        
        [self startAnima];
        return;
    }
    
    self.isAnimaing = YES;
    [UIView animateWithDuration:0.3 animations:^{
        //隐藏滑出presentView
        self.ny_x = -220;
        self.alpha = 0;
    } completion:^(BOOL finished) {
        
        
        if (finished) {
            //删除
            [self.giftModelsDic removeObjectForKey:self.selectedGiftModel.giftKeyID];
            
            
            
            for (int i = 0; i<self.giftModelskeys.count; i++) {
                NSString *keystr = self.giftModelskeys[i];
                
                if ([self.selectedGiftModel.giftKeyID isEqualToString:keystr]) {
                    [self.giftModelskeys removeObjectAtIndex:i];
                }
            }
            
            
            self.selectedModelIndex = 0;
            self.selectedGiftModel = nil;
            
            NSLog(@"动画结束 pressentView隐藏");
            self.isAnimaing = NO;
            [self startAnima];
        }
        
    }];
}

-(void)finishHidden{
    //两秒后执行隐藏
    self.isAnimaing = NO;
    
    //    __block double n = self.countDownTime;
    // 必须创建成全局变量，否则执行一次就会被release掉。
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, 0.3 * NSEC_PER_SEC, 0);
    // 计时器的触发block
    dispatch_source_set_event_handler(self.timer, ^{
        if (self.countDownTime < 0) {
            [self hiddenPresentView];
            dispatch_source_cancel(self.timer);
        }
        self.countDownTime = self.countDownTime - 0.3;
    });
    
    // 计时器cancel的时候触发的block
    dispatch_source_set_cancel_handler(self.timer, ^{
        //        NSLog(@"cancel");
    });
    
    // 因为dispatch_source启动时默认是挂起状态的，需要手动启动。
    dispatch_resume(self.timer);
}


//开始动画
-(void)startAnima{
    
    
    self.isAnimaing = NO;
    if (!self.giftModelskeys.count) {
        return;
    }
    
    NSString *key = self.giftModelskeys[0];
    //获取到key对应的数组
    NSMutableArray<NYGiftModel *> *mArr = self.giftModelsDic[key];
    
    if (mArr.count > self.selectedModelIndex){
        //获取到礼物动画模型
        NYGiftModel *giftModel = mArr[self.selectedModelIndex];
        //当前前执行的礼物模型
        self.selectedGiftModel = giftModel;
        //开始动画
        self.giftModel = giftModel;
        
        self.selectedModelIndex = self.selectedModelIndex + 1;
        self.shakeLabel.text = [NSString stringWithFormat:@"x%lu",self.selectedModelIndex];
        
        self.isAnimaing = YES;
        self.countDownTime = 2;
        if (self.ny_x != 0) { //还未弹出 执行弹出 然后sk放大一下 就好了
            [UIView animateWithDuration:0.3 animations:^{
                //显示出presentView
                self.ny_x = 0;
                self.alpha = 1;
                
            } completion:^(BOOL finished) {
                if (finished) {
                    
                    //弹出后shake描边动画执行
                    [self.shakeLabel startAnimWithDuration:0.3 completion:^(BOOL finished) {
                        if (finished) {
                            if (self.giftModelsDic[self.selectedGiftModel.giftKeyID].count > self.selectedModelIndex) {
                                [self startAnima];
                            }else{
                                //两秒后执行隐藏
                                [self finishHidden];
                            }
                        }
                    }];
                }
                
            }];
        }else{
            
            //弹出后shake描边动画执行
            [self.shakeLabel startAnimWithDuration:0.3 completion:^(BOOL finished) {
                if (finished) {
                    if (finished) {
                        if (self.giftModelsDic[self.selectedGiftModel.giftKeyID].count > self.selectedModelIndex) {
                            [self startAnima];
                        }else{
                            //两秒后执行隐藏
                            [self finishHidden];
                        }
                    }
                }
            }];
        }
    }
    
}


-(NSMutableDictionary<NSString *,NSMutableArray<NYGiftModel *> *> *)giftModelsDic{
    if (!_giftModelsDic) {
        _giftModelsDic = [NSMutableDictionary dictionary];
    }
    return _giftModelsDic;
}

-(NSMutableArray *)giftModelskeys{
    if (!_giftModelskeys) {
        _giftModelskeys = [NSMutableArray array];
    }
    return _giftModelskeys;
}

@end
