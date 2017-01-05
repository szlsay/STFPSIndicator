//
//  ViewController.m
//  STFPSIndicatorDemo
//
//  Created by ST on 17/1/3.
//  Copyright © 2017年 ST. All rights reserved.
//

#import "ViewController.h"
#import "STFPSIndicator.h"
@interface ViewController ()
/** 1.文本框 */
@property(nonatomic, strong)UITextView *textView ;
@end

@implementation ViewController

#pragma mark - --- 1.init 生命周期 ---
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"测试 FPS";
    [self.view addSubview:self.textView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(stopFPS)];
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(startFPS)];
}
#pragma mark - --- 2.delegate 视图委托 ---

#pragma mark - --- 3.event response 事件相应 ---

- (void)stopFPS
{
    [[STFPSIndicator sharedFPSIndicator]hide];
}

- (void)startFPS
{
    [[STFPSIndicator sharedFPSIndicator]show];
}

#pragma mark - --- 4.private methods 私有方法 ---

#pragma mark - --- 5.setters 属性 ---

#pragma mark - --- 6.getters 属性 —--

- (UITextView *)textView {
    if(!_textView) {
        _textView = [[UITextView alloc] initWithFrame:self.view.frame];
        NSMutableString *strM = [NSMutableString string];
        _textView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        for (int i = 0; i < 1000; i++) {
            [strM appendString:@"       高校思想政治工作队伍兢兢业业、甘于奉献、奋发有为，为高等教育事业发展作出了重要贡献。实践证明，这是一支不可或缺的队伍，也是一支值得信赖的队伍。各级党委、政府和高校要像关心教学科研骨干的成长一样关心思想政治工作队伍成长，使他们工作有条件、干事有平台、待遇有保障、发展有空间，最大限度调动他们的积极性、主动性、创造性。\n"];
        }
        _textView.text = strM;
    }
    return _textView;
}


@end
