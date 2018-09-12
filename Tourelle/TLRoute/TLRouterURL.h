//
//  TLRouterURL.h
//  Pods-Tourelle_Example
//
//  Created by 朱衡 on 2018/8/11.
//

#import <Foundation/Foundation.h>

@interface TLRouterURL : NSURL
@property (nonatomic, copy, readonly) NSString *urlWithoutParms;
@property (nonatomic, strong, readonly) NSDictionary<NSString *,id> *params;

+(instancetype)URLWithString:(NSString *)URLString params:(NSDictionary<NSString *,id> *)params;
@end
