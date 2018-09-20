//
//  TLUserModuleContainer.m
//  Tourelle_Example
//
//  Created by 朱衡 on 2018/9/18.
//  Copyright © 2018 sczh2013@163.com. All rights reserved.
//

#import "TLUserModuleContainer.h"
#import "TLInvocationHelper.h"
#import "Tourelle_Example-Swift.h"
#import "TLAppLaunchHelper.h"

@interface TLUserModuleContainer ()
@end

@implementation TLUserModuleContainer

+( id<TLUserModuleProtocol>)module {
    static id<TLUserModuleProtocol> instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSDictionary *dict = [self dictWithPlist:@"DataModules.plist"];
        NSString* className = [dict objectForKey:@"TLUserModuleContainer"];
        id object = [TLInvocationHelper performClass:className selector:@selector(initWithParam:) params:[NSDictionary new]];

        if ([object conformsToProtocol:@protocol(TLUserModuleProtocol)]) {
            instance = object;
        }
        
    });
    
    return instance;
}

@end
