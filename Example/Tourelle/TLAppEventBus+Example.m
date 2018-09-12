//
//  TLAppEventBus+Example.m
//  Tourelle_Example
//
//  Created by 朱衡 on 2018/8/12.
//  Copyright © 2018 sczh2013@163.com. All rights reserved.
//
#import <Objc/runtime.h>
#import "TLAppEventBus+Example.h"
NSString * const KDidChangeStatusBarOrientation = @"didChangeStatusBarOrientation";
@implementation TLAppEventBus (Example)

-(void)setDidChangeStatusBarOrientation:(NSNotification *)didChangeStatusBarOrientation {
    objc_setAssociatedObject(self, (__bridge const void *)KDidChangeStatusBarOrientation , didChangeStatusBarOrientation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSNotification *)didChangeStatusBarOrientation {
    return objc_getAssociatedObject(self, (__bridge const void *)KDidBecomeActive);
}

@end
