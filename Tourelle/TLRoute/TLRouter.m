//
//  TLRouter.m
//  Pods-Tourelle_Example
//
//  Created by 朱衡 on 2018/8/11.
//

#import "TLRouter.h"
#import "TLRouterURL.h"

@interface TLRouter ()
@property (nonatomic, class, readonly) TLRouter * shared;
@property (nonatomic, strong) dispatch_queue_t syncQueue;
@property (nonatomic, strong) NSMutableDictionary<NSString *,void (^)(TLRouterURL* routeURL, void (^)(BOOL result))> *routeMap;
@end

@implementation TLRouter

+(TLRouter *)shared {
    static TLRouter * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [TLRouter new];
        instance.syncQueue = dispatch_queue_create("com.tlrouter.syncqueue", nil);
        instance.routeMap = [NSMutableDictionary new];
    });
    return instance;
}

+(void)registerURL:(NSString *)url hander:(void (^)(TLRouterURL* routeURL, void (^callback)(BOOL result)))hander {
    TLRouterURL *tlUrl = [TLRouterURL URLWithString:url params:nil];
    NSAssert(tlUrl.urlWithoutParms!=nil, @"URL不合法");
    if (tlUrl.urlWithoutParms) {
        dispatch_async(TLRouter.shared.syncQueue, ^{
            [TLRouter.shared.routeMap setObject:hander forKey:tlUrl.urlWithoutParms];
        });
    }
}

+(void)unRegisterURL:(NSString *)url {
    TLRouterURL *tlUrl = [TLRouterURL URLWithString:url params:nil];
    NSAssert(tlUrl.urlWithoutParms!=nil, @"URL不合法");
    if (tlUrl.urlWithoutParms) {
        dispatch_async(TLRouter.shared.syncQueue, ^{
            [TLRouter.shared.routeMap removeObjectForKey:tlUrl.urlWithoutParms];
        });
    }
}

+(void)openURL:(NSString *)url callback:(void (^)(BOOL result))callback {
    [TLRouter openURL:url param:nil callback:callback];
}

+(BOOL )openURL:(NSString *)url{
    BOOL reslut = [TLRouter openURL:url param:nil];
    return reslut;
}

+(void)openURL:(NSString *)url param:(NSDictionary<NSString*,id> *)param callback:(void (^)(BOOL result))callback {
    TLRouterURL *tlUrl = [TLRouterURL URLWithString:url params:param];
    void (^block)(TLRouterURL* routeURL, void (^)(BOOL result)) = [TLRouter.shared.routeMap objectForKey:tlUrl.urlWithoutParms];
    if (block) {
        block(tlUrl,callback);
    }
}

+(BOOL )openURL:(NSString *)url param:(NSDictionary<NSString *,id> *)param {
    TLRouterURL *tlUrl = [TLRouterURL URLWithString:url params:param];
    void (^block)(TLRouterURL* routeURL, void (^)(BOOL result)) = [TLRouter.shared.routeMap objectForKey:tlUrl.urlWithoutParms];
    __block BOOL reslut = NO;
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    void (^callback)(BOOL value) = ^(BOOL value) {
        reslut = value;
        dispatch_semaphore_signal(semaphore);
    };
    
    if (block) {
        block(tlUrl,callback);
    }
    
    dispatch_semaphore_wait(semaphore,DISPATCH_TIME_FOREVER);
    return reslut;
}

@end
