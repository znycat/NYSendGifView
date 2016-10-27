//
//  ViewController.m
//  送礼物Demo
//
//  Created by zhainaiyu on 2016/10/26.
//  Copyright © 2016年 com.znycat.ios. All rights reserved.
//
#pragma mark - 1.获取屏幕宽度与高度
/**屏幕宽*/
#define NYScreenW [UIScreen mainScreen].bounds.size.width
/**屏幕高*/
#define NYScreenH [UIScreen mainScreen].bounds.size.height


#import "ViewController.h"
#import "NYShakeLabel.h"
#import "NYGiftMainView.h"
@interface ViewController ()
/** <#注释#>*/
@property (nonatomic,weak)NYGiftMainView *mainView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NYGiftMainView *mainView = [[NYGiftMainView alloc]initWithFrame:CGRectMake(0, 0, NYScreenW, 500)];
    [self.view addSubview:mainView];
    self.mainView = mainView;
    
    //多人送多种的思路。
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

}
//哈士奇送房子
- (IBAction)hashiqiFangzi:(id)sender {
    
    NYGiftModel *giftModel = [NYGiftModel new];
    giftModel.headImage = [UIImage imageNamed:@"hashiqi"];
    giftModel.name = @"哈士奇";
    giftModel.giftImage = [UIImage imageNamed:@"house"];
    giftModel.giftName = @"房子";
    giftModel.giftKeyID = [NSString stringWithFormat:@"%@%@",giftModel.name,giftModel.giftName];
     [self.mainView addModel:giftModel];
    
    for (int i = 0; i<5; i++) {
        [self.mainView addModel:giftModel];
    }

}
//海贼王送花
- (IBAction)haizeiwangHUa:(id)sender {
    
    NYGiftModel *giftModel = [NYGiftModel new];
    giftModel.headImage = [UIImage imageNamed:@"luffy"];
    giftModel.name = @"海贼王";
    giftModel.giftImage = [UIImage imageNamed:@"flower"];
    giftModel.giftName = @"花";
    giftModel.giftKeyID = [NSString stringWithFormat:@"%@%@",giftModel.name,giftModel.giftName];
    
    for (int i = 0; i<5; i++) {
        [self.mainView addModel:giftModel];
    }
    

}
//海贼王房子
- (IBAction)haizeifangzi:(id)sender {
    
    NYGiftModel *giftModel = [NYGiftModel new];
    giftModel.headImage = [UIImage imageNamed:@"luffy"];
    giftModel.name = @"海贼王";
    giftModel.giftImage = [UIImage imageNamed:@"house"];
    giftModel.giftName = @"房子";
    giftModel.giftKeyID = [NSString stringWithFormat:@"%@%@",giftModel.name,giftModel.giftName];
    
    for (int i = 0; i<5; i++) {
        [self.mainView addModel:giftModel];
    }
}




@end
