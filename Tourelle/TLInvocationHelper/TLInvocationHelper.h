//
//  TLInvocationHelper.h
//  Pods-Tourelle_Example
//
//  Created by 朱衡 on 2018/8/11.
//

#import <Foundation/Foundation.h>

#define TLInvocationDomain @"com.TLInvocationHelper.performClass"

typedef NS_ENUM(NSInteger,TLInvocationError) {
    TLInvocationError_No_Class,
    TLInvocationError_No_Selector,
    TLInvocationError_Param_Unmatch,
};

@interface TLInvocationHelper : NSObject

//失败时返回NSError，成功时返回nil或value
+ (id _Nullable)performClass:(NSString *)className selector:(nonnull SEL)selector params:(NSDictionary *_Nullable)params;
+ (id _Nullable)performInstance:(id)instance selector:(nonnull SEL)selector params:(NSDictionary *_Nullable)params;
@end
