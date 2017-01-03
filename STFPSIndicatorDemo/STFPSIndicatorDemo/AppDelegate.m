//
//  AppDelegate.m
//  STFPSIndicatorDemo
//
//  Created by ST on 17/1/3.
//  Copyright © 2017年 ST. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "STFPSIndicator.h"
@interface AppDelegate ()
@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    [self.window makeKeyAndVisible];
    [[STFPSIndicator sharedFPSIndicator] show];
    return YES;
}
@end
