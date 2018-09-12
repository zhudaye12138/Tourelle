//
//  TLRouterURL.m
//  Pods-Tourelle_Example
//
//  Created by 朱衡 on 2018/8/11.
//

#import "TLRouterURL.h"

@interface TLRouterURL() {
@private
    NSString* _urlWithoutParms;
    NSDictionary<NSString *,NSString*>* _params;
}
@end


@implementation TLRouterURL

+(instancetype)URLWithString:(NSString *)URLString params:(NSDictionary<NSString *,id> *)params {
    TLRouterURL *url = [TLRouterURL URLWithString:URLString];
    [url initializeWithParam:params];
    return url;
}

-(void)initializeWithParam:(NSDictionary<NSString *,id> *)params {
    
    if (self.scheme || self.host) {
        NSString *relativePath = [self.host stringByAppendingString:self.relativePath];
        _urlWithoutParms = [[self.scheme stringByAppendingString:@"://"] stringByAppendingString:(relativePath==nil?@"":relativePath)];
    }

    NSMutableDictionary *dict = [NSMutableDictionary new];
    
    NSArray<NSString*> *arr = [self.query componentsSeparatedByString:@"&"];
    
    [arr enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSArray *temp =  [obj componentsSeparatedByString:@"="];
        if (temp.count == 2) {
            [dict setObject:temp.lastObject forKey:temp.firstObject];
        }
    }];
    
    _params = [[NSDictionary alloc] initWithDictionary:dict copyItems:NO];
    
    if (params) {
        [_params setValuesForKeysWithDictionary:params];
    }
}

@end
