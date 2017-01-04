//
//  STFPSIndicator.m
//  STFPSIndicatorDemo
//
//  Created by ST on 17/1/3.
//  Copyright © 2017年 ST. All rights reserved.
//

#import "STFPSIndicator.h"

#define TagLabelFPS (2017010316)
#define LabelGreen [UIColor colorWithRed:0.0 green:0.8 blue:0.0 alpha:1]

@interface STFPSIndicator ()
/** 1.显示频率定时器 */
@property(nonatomic, strong)CADisplayLink *displayLink;
/** 2.文本视图 */
@property(nonatomic, strong)UILabel *labelFps;
/** 3.数值 */
@property(nonatomic, assign)NSUInteger count;
/** 4.最后的时间节点 */
@property(nonatomic, assign)NSTimeInterval lastTime;
@end

@implementation STFPSIndicator

#pragma mark - --- 1.init 生命周期 ---

+ (STFPSIndicator *)sharedFPSIndicator{
    static dispatch_once_t onceToken;
    static STFPSIndicator *_instance;
    dispatch_once(&onceToken, ^{
        _instance = [[STFPSIndicator alloc] init];
    });
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addObserver];
    }
    return self;
}

#pragma mark - --- 2.delegate 视图委托 ---

#pragma mark - --- 3.event response 事件相应 ---
- (void)displayLinkTick:(CADisplayLink *)link {
    if (self.lastTime == 0) {
        self.lastTime = link.timestamp;
        return;
    }
    self.count++;
    NSTimeInterval delta = link.timestamp - self.lastTime;
    if (delta < 1) {
        return;
    }
    self.lastTime = link.timestamp;
    int fps = (int)round(self.count / delta);
    NSString *text = [NSString stringWithFormat:@"%d FPS",fps];
    
    if (fps < 30) {
        [self.labelFps setTextColor:[UIColor redColor]];
    }else {
        [self.labelFps setTextColor:LabelGreen];
    }
    
    [self.labelFps setText:text];
    self.count = 0;
}

- (void)addObserver
{
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(applicationDidBecomeActiveNotification)
                                                 name: UIApplicationDidBecomeActiveNotification
                                               object: nil];
    
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(applicationWillResignActiveNotification)
                                                 name: UIApplicationWillResignActiveNotification
                                               object: nil];
    
}

- (void)applicationDidBecomeActiveNotification {
    [self.displayLink setPaused:NO];
}

- (void)applicationWillResignActiveNotification {
    [self.displayLink setPaused:YES];
}
#pragma mark - --- 4.private methods 私有方法 ---
- (void)show {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj == self.labelFps) {
            return ;
        }
    }];

    [self.displayLink setPaused:NO];
    [keyWindow addSubview:self.labelFps];
}

- (void)hide {
    [self.displayLink setPaused:YES];
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj == self.labelFps) {
            [obj removeFromSuperview];
            return;
        }
    }];

}

#pragma mark - --- 5.setters 属性 ---

#pragma mark - --- 6.getters 属性 —--
- (CADisplayLink *)displayLink
{
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkTick:)];
        [_displayLink setPaused:YES];
        [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
    return _displayLink;
}

- (UILabel *)labelFps
{
    if (!_labelFps) {
        _labelFps = [[UILabel alloc] init];
        _labelFps.textColor = LabelGreen;
        _labelFps.tag = TagLabelFPS;
        _labelFps.font = [UIFont boldSystemFontOfSize:12];
        _labelFps.backgroundColor = [UIColor clearColor];
        _labelFps.textAlignment = NSTextAlignmentCenter;
        _labelFps.frame = CGRectMake(64, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 20);
        _labelFps.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    }
    return _labelFps;
}
@end


@implementation UIWindow (STFPSIndicator)

- (void)layoutSubviews {
    
    [super layoutSubviews];
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.tag == TagLabelFPS) {
            [self bringSubviewToFront:obj];
            return;
        }
    }];
}

@end
