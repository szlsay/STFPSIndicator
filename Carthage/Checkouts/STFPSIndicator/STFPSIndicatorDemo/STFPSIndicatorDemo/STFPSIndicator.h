//
//  STFPSIndicator.h
//  STFPSIndicatorDemo
//
//  Created by ST on 17/1/3.
//  Copyright © 2017年 ST. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface STFPSIndicator : NSObject

/** 1.初始化, 视图一定要添加到UIWindow初始化事件之后，否则没法显示 */
+ (STFPSIndicator *)sharedFPSIndicator;
/** 2.显示视图 */
- (void)show;
/** 3.隐藏视图 */
- (void)hide;

@end

NS_ASSUME_NONNULL_END
