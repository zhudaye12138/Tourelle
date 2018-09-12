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

/*
 AutoInitialize.plist
 classes
        item0 classA
        item1  classB
 */
@interface TLAppLaunchHelper : NSObject
@property (nonatomic, strong, readonly) dispatch_queue_t launchQueue;
@property (nonatomic, class, readonly) TLAppLaunchHelper* shared;
-(void)autoInitialize;
-(void)autoRegistURL;
@end
