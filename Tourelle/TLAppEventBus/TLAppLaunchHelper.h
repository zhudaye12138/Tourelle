//
//  TLAppLaunchHelper.h
//  Pods-Tourelle_Example
//
//  Created by 朱衡 on 2018/8/11.
//

#import <Foundation/Foundation.h>

@protocol AppLaunchProtocol
- (void)initializeWhenLaunch;
@end


@protocol IoCObjectProtocol
-(instancetype)initWithParam:(NSDictionary *)param;
@end


/*
 AutoInitialize.plist
 classes
        item0 classA
        item1  classB
 */
@interface TLAppLaunchHelper : NSObject
@property (nonatomic, strong, readonly) dispatch_queue_t launchQueue;
@property (nonatomic, class, readonly) TLAppLaunchHelper* shared;

//init modules with AutoInitialize
-(void)autoInitModule;
//init url with AutoRegistURL
-(void)autoRegistURL;

@end
