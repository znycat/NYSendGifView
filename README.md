猫猫分享，必须精品

[原创文章，欢迎转载。转载请注明：翟乃玉的博客
地址：http://www.jianshu.com/notebooks/4236923/latest](http://www.jianshu.com/users/66997b24ba98/latest_articles)

# 一：问题来源：
不知如何说，总之公司项目，做直播，然后百度，发现有一个demo可以用，然后用的时候发现了各种问题，比如送的礼物的个数不对，比如和实际的情况不尽相同. 长连接过来的数据都是礼物数量为1的. 不可能给足所有礼物数量的。比如动画的分发很不合理，最严重的莫过于送不同的礼物也会给第一个礼物累加。。。。。。。

#二：解决：
话不多说，直接看图
![123.gif](http://upload-images.jianshu.io/upload_images/1594999-fcf12a2c51bb50b2.gif?imageMogr2/auto-orient/strip)

## 1：思路：从网上demo中我知道了描边 还有放大缩小动画效果，已知右侧出来的是view动画，调控x的值就好。然后结构如图：

![Snip20161027_2.png](http://upload-images.jianshu.io/upload_images/1594999-5284de8cd1d34645.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 2：model
```
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NYGiftModel : NSObject
@property (nonatomic,strong) UIImage *headImage; // 头像图片
@property (nonatomic,strong) UIImage *giftImage; // 礼物图片
@property (nonatomic,copy) NSString *name; // 送礼物者
@property (nonatomic,copy) NSString *giftName; // 礼物名称
@property (nonatomic,copy) NSString *giftKeyID;//唯一标示礼物的ID key
@end
```

模型可以扩展，简单明了， 这里我用giftKeyID来唯一标示礼物的ID（随意）
## 3：主要view
 ### NYShakeLabel
这个就是描边的label，不啰嗦， 唯一值得说的是我将动画完成的block通过方法传出了：
    - (void)startAnimWithDuration:(NSTimeInterval)duration completion:(void (^ __nullable)(BOOL finished)) completion;

 ###  NYPresentView
最繁琐的。。。 猫猫现在脑细胞不足，想深入了解可以私聊我 ，因为这里并没有用多线程（用gcd做了一个延迟操作，你想用nstimer也行）也没有用高深东西，都是逻辑性的（算是算法吧。。。）

### NYGiftMainView
本来想叫他manger类的。。 目的就是为了可以继承起来简单。。 然而脑抽取了这名字也不想改了，就这样吧临时。

这里就说一下咋用吧，首先 拖进去，然后创建个模型，最后找个button 写个方法啥的：
```
NYGiftModel *giftModel = [NYGiftModel new];
    giftModel.headImage = [UIImage imageNamed:@"hashiqi"];
    giftModel.name = @"哈士奇";
    giftModel.giftImage = [UIImage imageNamed:@"house"];
    giftModel.giftName = @"房子";
    giftModel.giftKeyID = [NSString stringWithFormat:@"%@%@",giftModel.name,giftModel.giftName];

     [self.mainView addModel:giftModel];

```

没错，将 [self.mainView addModel:giftModel]; 这个方法执行下，把model扔进去就能用了。。。。


[附赠：全球最大同性交友社区地址 https://github.com/znycat/NYSendGifView](https://github.com/znycat/NYSendGifView)

