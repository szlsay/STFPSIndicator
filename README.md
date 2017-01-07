# STFPSIndicator
iOS FPS的检测器

## 使用方式
### Pod

`pod 'STFPSIndicator', :configurations => ['Debug']`
### Carthage
`github "stzhenzhaoliang/STFPSIndicator" "1.0"`

## 接口
``` 
/** 1.初始化, 视图一定要添加到UIWindow初始化事件之后，否则没法显示 */
+ (STFPSIndicator *)sharedFPSIndicator;
/** 2.显示视图 */
- (void)show;
/** 3.隐藏视图 */
- (void)hide;
``` 
## 效果图
![](https://github.com/STShenZhaoliang/STImage/raw/master/STFPSIndicator/STFPS.gif)

