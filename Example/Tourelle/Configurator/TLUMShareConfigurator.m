//
//  TLUMShareConfigurator.m
//  Tourelle_Example
//
//  Created by 朱衡 on 2018/9/6.
//  Copyright © 2018 sczh2013@163.com. All rights reserved.
//

#import "TLUMShareConfigurator.h"
#import "TLAppLaunchHelper.h"
#import "TLAppEventBus.h"
#import "TLRouter.h"
#import <UMSocialCore/UMSocialCore.h>
#import "Tourelle_Example-Swift.h"

@interface TLUMShareConfigurator () <AppLaunchProtocol>
@property (nonatomic, strong) NSString *appkey;

@property (nonatomic, strong) NSDictionary *qqConfigDict;
@property (nonatomic, strong) NSDictionary *weChatConfigDict;
@end

@implementation TLUMShareConfigurator

- (void)initializeWhenLaunch {
    NSDictionary *dict = [self dictWithPlist:@"AppConfigurator.plist"];
    [self safeSetValuesForKeys:[dict objectForKey:NSStringFromClass([self class])]];
    
    dispatch_async(TLAppLaunchHelper.shared.launchQueue, ^{
        // 设置友盟key
        NSAssert(self.appkey, @"缺少友盟[Umeng]配置");
        NSAssert(self.qqConfigDict, @"缺少友盟[QQ]配置");
        NSAssert(self.weChatConfigDict, @"缺少友盟[WeChat]配置");
        
        if (!self.appkey) {
            NSLog(@"缺少友盟[Umeng]配置");
            return;
        }
        
#if DEBUG
        /* 打开调试日志 */
        [[UMSocialManager defaultManager] openLog:YES];
#endif
        // 设置友盟appkey
        [[UMSocialManager defaultManager] setUmSocialAppkey:self.appkey];
        
        // 设置可选择的平台
        
        UMSocialPlatformType type;
        
        if (self.qqConfigDict) {
            type = UMSocialPlatformType_QQ;
            [self setSubPlatConfig:self.qqConfigDict type:type];
            
            NSString *qqScheme = [self.qqConfigDict objectForKey:@"scheme"];
            //注册
            [TLRouter registerURL:[qqScheme stringByAppendingString:@"://"] hander:^(TLRouterURL *routeURL, void (^callback)(BOOL result)) {
                BOOL result = [[UMSocialManager defaultManager] handleOpenURL:[NSURL URLWithString:routeURL.urlWithoutParms]];
                callback(result);
                
            }];
        }
        
        if (self.weChatConfigDict) {
            type = UMSocialPlatformType_WechatSession;
            [self setSubPlatConfig:self.weChatConfigDict type:type];
            
            NSString *wechatScheme = [self.weChatConfigDict objectForKey:@"scheme"];
            
            [TLRouter registerURL:wechatScheme hander:^(TLRouterURL *routeURL, void (^callback)(BOOL result)) {
                BOOL result = [[UMSocialManager defaultManager] handleOpenURL:[NSURL URLWithString:routeURL.urlWithoutParms]];
                callback(result);
                
            }];
        }
        
        //测试
        //        PHIRouter* route = [PHIRouter openWithUrlString:@"QQ41EB5FB7://"];
        //        NSLog(@"err = %@",route.error);
    });
    
    
    
//    [PHIAppEventBus.shared holdOnObserver:self];
}

- (void)setSubPlatConfig:(NSDictionary *)subPlatDict type:(UMSocialPlatformType)type {
    NSString *appKey = subPlatDict[@"appkey"];
    NSString *secret = subPlatDict[@"appsecret"];
    NSString *redirectUrl = subPlatDict[@"redirectUrl"];
    
    BOOL retVal = [[UMSocialManager defaultManager] setPlaform:type appKey:appKey appSecret:secret redirectURL:redirectUrl];
    if (retVal) {
        NSLog(@"友盟 [%ld]--->初始化成功", (long)type);
    }
}


@end
