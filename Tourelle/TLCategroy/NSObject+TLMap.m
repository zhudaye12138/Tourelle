//
//  NSObject+TLMap.m
//  Nimble
//
//  Created by 朱衡 on 2018/8/14.
//

#import "NSObject+TLMap.h"

@implementation NSObject (TLMap)

-(id)map:(TLMapBlock)block {
    NSParameterAssert(block);
    if (block) {
        id ret = block(self);
        return ret;
    }
    return nil;
}

@end
