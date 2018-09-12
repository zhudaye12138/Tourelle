//
//  TLRouter.h
//  Pods-Tourelle_Example
//
//  Created by 朱衡 on 2018/8/11.
//

#import <Foundation/Foundation.h>
#import "TLRouterURL.h"
@protocol TLRouterVCProtocol
-(instancetype)initWithParam:(NSDictionary *)param;
@optional
-(BOOL)presentingSelf;
@end

@interface TLRouter : NSObject

//支持只有schema
+(void)registerURL:(NSString *)url hander:(void (^)(TLRouterURL* routeURL, void (^callback)(BOOL result)))hander;
+(void)unRegisterURL:(NSString *)url;
+(void)openURL:(NSString *)url callback:(void (^)(BOOL result))callback;
+(BOOL)openURL:(NSString *)url;
+(void)openURL:(NSString *)url param:(NSDictionary<NSString*,id> *)param callback:(void (^)(BOOL result))callback;
+(BOOL)openURL:(NSString *)url param:(NSDictionary<NSString *,id> *)param;

@end
