//
//  TLHarpyConfigurator.m
//  Tourelle_Example
//
//  Created by 朱衡 on 2018/9/11.
//  Copyright © 2018 sczh2013@163.com. All rights reserved.
//

#import "TLHarpyConfigurator.h"
#import "Tourelle_Example-Swift.h"
#import "TLAppLaunchHelper.h"
#import "Harpy.h"
#import "TLAppEventBus.h"

@interface TLHarpyConfigurator()<AppLaunchProtocol>
@property (nonatomic, assign) BOOL isAppStore;
@end

@implementation TLHarpyConfigurator
- (void)initializeWhenLaunch {
    NSDictionary *dict = [self dictWithPlist:@"AppConfigurator.plist"];
    [self safeSetValuesForKeys:[dict objectForKey:NSStringFromClass([self class])]];
    Harpy *harpyShare = [Harpy sharedInstance];
    harpyShare.presentingViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    harpyShare.alertControllerTintColor = [UIColor purpleColor];
    harpyShare.alertType = HarpyAlertTypeOption;
    harpyShare.forceLanguageLocalization = HarpyLanguageChineseSimplified;
    harpyShare.debugEnabled = FALSE;
    [harpyShare checkVersion];
    
    [TLAppEventBus.shared.didBecomeActive observeWithBlock:^(id newValue) {
        if (self.isAppStore == TRUE) {
            [harpyShare checkVersionWeekly];
        }
    }];
    
}

@end
