//
//  TLAppDelegate.m
//  Tourelle
//
//  Created by sczh2013@163.com on 08/12/2018.
//  Copyright (c) 2018 sczh2013@163.com. All rights reserved.
//

#import "TLAppDelegate.h"
#import "TLAppEventBus.h"
#import "TLAppLaunchHelper.h"
#import "TLRouter.h"
#import "TLAppEventBus+Example.h"

@implementation TLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [TLAppLaunchHelper.shared autoInitialize];//根据AutoInitialize.plist 自动初始化组件
    [TLAppLaunchHelper.shared autoRegistURL];//根据AutoRegistURL.plist 自动初始化路由
    
    NSMutableDictionary *defaultMap = [NSMutableDictionary dictionaryWithDictionary:[TLAppEventBus defaultNotificationMap]];
    [defaultMap setObject:KDidChangeStatusBarOrientation forKey:UIApplicationWillChangeStatusBarOrientationNotification];
    [TLAppEventBus.shared startWithNotificationMap:defaultMap];//开启EventBus，开启后组件可收到App生命周期事件

    return YES;
}


-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    return [TLRouter openURL:[url path]]; //路由
}


@end
