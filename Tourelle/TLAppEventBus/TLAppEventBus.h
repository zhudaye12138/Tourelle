//
//  TLAppEventBus.h
//  Nimble
//
//  Created by 朱衡 on 2018/8/11.
//

#import <Foundation/Foundation.h>
#import "NSObject+TLKVO.h"

#define AppEventBus TLAppEventBus.shared

extern NSString * const KDidEnterBackground;
extern NSString * const KWillEnterForeground;
extern NSString * const KDidFinishLaunch;
extern NSString * const KDidBecomeActive;
extern NSString * const KWillResignActive;
extern NSString * const KDidReceiveMemoryWarning;
extern NSString * const KWillTerminate;
extern NSString * const KSignificantTimeChange;

@interface TLAppEventBus : NSObject
@property (atomic, class ,readonly) TLAppEventBus* shared;
+ (NSDictionary *)defaultNotificationMap;
- (void)start;
- (void)startWithNotificationMap:(NSDictionary<NSString *,NSString *> *)map;
- (void)stop;
- (BOOL)isRunning;

@property (nonatomic, strong) NSNotification * didEnterBackground;
@property (nonatomic, strong) NSNotification * willEnterForeground;
@property (nonatomic, strong) NSNotification * didFinishLaunch;
@property (nonatomic, strong) NSNotification * didBecomeActive;
@property (nonatomic, strong) NSNotification * willResignActive;
@property (nonatomic, strong) NSNotification * didReceiveMemoryWarning;
@property (nonatomic, strong) NSNotification * willTerminate;
@property (nonatomic, strong) NSNotification * significantTimeChange;
@end
