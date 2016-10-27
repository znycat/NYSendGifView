//
//  NYGiftMainView.m
//  送礼物Demo
//
//  Created by zhainaiyu on 2016/10/27.
//  Copyright © 2016年 com.znycat.ios. All rights reserved.
//

#import "NYGiftMainView.h"
#import "NYPresentView.h"
#import "NYGiftModel.h"
#import "UIView+NYExtension.h"
@interface NYGiftMainView()
/** 弹出的View*/
@property (nonatomic,weak)NYPresentView *presentView;

@property (nonatomic,weak)NYPresentView *presentView2;

/** <#注释#>*/
@property (nonatomic,strong)NSMutableArray<NSString *> *giftModelKeyStrArr;


@end
@implementation NYGiftMainView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //初始化
        self.backgroundColor = [UIColor clearColor];
        [self presentView];
        [self presentView2];
        
    }
    return self;
}


-(void)addModel:(NYGiftModel *)model{
    
    //    是否有
    BOOL hasKey = NO;
    int index = 0;
    for (int i = 0; i<self.giftModelKeyStrArr.count; i++) {
        NSString *str = self.giftModelKeyStrArr[i];
        if ([str isEqualToString:model.giftKeyID]) {
            hasKey = YES;
            index = i;
        }
    }
    
    if (!hasKey) {
        [self.giftModelKeyStrArr addObject:model.giftKeyID];
    }
    
    NSMutableArray *modelArray1 = self.presentView.giftModelsDic[model.giftKeyID];
    NSMutableArray *modelArray2 = self.presentView2.giftModelsDic[model.giftKeyID];
    
    if (index % 2) {
        if (!modelArray1){
            modelArray1 = [NSMutableArray array];
        }
        [modelArray1 addObject:model];
        [self startAnimaWithModel:model presentView:self.presentView array:modelArray1];
    }else{
        if (!modelArray2){
            modelArray2 = [NSMutableArray array];
        }
        [modelArray2 addObject:model];
        [self startAnimaWithModel:model presentView:self.presentView2 array:modelArray2];
    }

    
}

-(void)startAnimaWithModel:(NYGiftModel *)model presentView:(NYPresentView *)presentView array:(NSMutableArray *)modelArray {
    
    //将数组放回去
    [presentView.giftModelsDic setObject:modelArray forKey:model.giftKeyID];
    //    是否有
        BOOL hasModelKey = NO;
        for (NSString *str in presentView.giftModelskeys) {
            if ([str isEqualToString:model.giftKeyID]) {
                hasModelKey = YES;
            }
        }
    
        if (!hasModelKey) {
            [presentView.giftModelskeys addObject:model.giftKeyID];
        }
    
        if (!presentView.isAnimaing) {
            [presentView startAnima];
        }
}





#pragma mark - 懒加载
-(NYPresentView *)presentView{
    if (!_presentView) {
        NYPresentView *presentV = [[[NSBundle mainBundle] loadNibNamed:@"NYPresentView" owner:nil options:nil] firstObject];
        [self addSubview:presentV];
        _presentView = presentV;
        presentV.frame = CGRectMake(-220, self.ny_height * 0.3, 220, 60);
        presentV.alpha = 0;
        
        
    }
    return _presentView;
}

-(NYPresentView *)presentView2{
    if (!_presentView2) {
        NYPresentView *presentV = [[[NSBundle mainBundle] loadNibNamed:@"NYPresentView" owner:nil options:nil] firstObject];
        [self addSubview:presentV];
        _presentView2 = presentV;
        presentV.frame = CGRectMake(-220, self.ny_height * 0.3 + 100, 220, 60);
        presentV.alpha = 0;
        
        
    }
    return _presentView2;
}

-(NSMutableArray<NSString *> *)giftModelKeyStrArr{
    if (!_giftModelKeyStrArr) {
        _giftModelKeyStrArr = [NSMutableArray array];
    }
    return _giftModelKeyStrArr;
}

@end
