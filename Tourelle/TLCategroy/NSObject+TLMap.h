//
//  NSObject+TLMap.h
//  Nimble
//
//  Created by 朱衡 on 2018/8/14.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

typedef id _Nullable(^TLMapBlock)(id _Nullable value);
@interface NSObject (TLMap)
-(_Nullable id)map:(TLMapBlock)block;
@end

NS_ASSUME_NONNULL_END
