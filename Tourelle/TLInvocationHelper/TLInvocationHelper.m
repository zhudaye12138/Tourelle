//
//  TLInvocationHelper.m
//  Pods-Tourelle_Example
//
//  Created by 朱衡 on 2018/8/11.
//


#define ACTION_PARAMS_COUNT(action) ([action componentsSeparatedByString:@":"].count - 1)

#import "TLInvocationHelper.h"

@implementation TLInvocationHelper
/**********************************************************************/
#pragma mark - Public
/**********************************************************************/
+ (id _Nullable)performClass:(NSString *)className selector:(nonnull SEL)selector params:(NSDictionary *_Nullable)params {
    NSAssert(selector, @"selector 为空");
    NSAssert(className, @"className 为空");
    
    Class class = NSClassFromString(className);
    id target = [[class alloc] init];
    
    if (class != nil) {
        return [self invocationWithTarget:target selector:selector params:params];
    } else {
        NSLog(@"%@", [NSString stringWithFormat:@"没有这个类：%@", className]);
        return [NSError errorWithDomain:TLInvocationDomain code:TLInvocationError_No_Class userInfo:nil];
    }
}

+ (id _Nullable)performInstance:(id)instance selector:(nonnull SEL)selector params:(NSDictionary *_Nullable)params {
    NSAssert(selector, @"selector 为空");
    NSAssert(instance, @"instance 为空");
    
    if (instance != nil) {
        return [self invocationWithTarget:instance selector:selector params:params];
    } else {
        NSLog(@"%@", [NSString stringWithFormat:@"没有这个实例：%@", instance]);
        return [NSError errorWithDomain:TLInvocationDomain code:TLInvocationError_No_Class userInfo:nil];
    }
}

/**********************************************************************/
#pragma mark - Privite
/**********************************************************************/
+ (NSArray *)arrayWithArgs:(va_list)args {
    va_list args_copy;
    
    __va_copy(args_copy, args);
    NSMutableArray *arr = [NSMutableArray new];
    while (va_arg(args, NSObject *)) {
        [arr addObject:va_arg(args, NSObject *)];
    }
    va_end(args);
    
    return [NSArray arrayWithArray:arr];
}

+ (id)invocationWithTarget:(id)target selector:(SEL)selector params:(NSDictionary *)params {
#define RETURN_BY_TYPE(invocation, type)  \
do {                                  \
type val = 0;                     \
[invocation getReturnValue:&val]; \
return @(val);                    \
} while (0)
    
    NSString *action = NSStringFromSelector(selector);
    NSMethodSignature *methodSig = [target methodSignatureForSelector:selector];
    
    if (![target respondsToSelector:selector] || (methodSig == nil)) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ 没有找到方法---> %@", target, action]);
        return [NSError errorWithDomain:TLInvocationDomain code:TLInvocationError_No_Selector userInfo:nil];
    }
    
    if (ACTION_PARAMS_COUNT(action) != (params == nil ? 0:1)) {
        NSLog(@"参数个数与方法不匹配");
        return [NSError errorWithDomain:TLInvocationDomain code:TLInvocationError_Param_Unmatch userInfo:nil];
    }
    
    const char *returnType = [methodSig methodReturnType];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];

    if (params) {
        [invocation setArgument:&params atIndex:2];
    }
    
    [invocation setSelector:selector];
    [invocation setTarget:target];
    [invocation invoke];
    
    if (strcmp(returnType, @encode(void)) == 0) {
        return nil;
    } else if (strcmp(returnType, @encode(char)) == 0) {
        RETURN_BY_TYPE(invocation, char);
    } else if (strcmp(returnType, @encode(int)) == 0) {
        RETURN_BY_TYPE(invocation, int);
    } else if (strcmp(returnType, @encode(short)) == 0) {
        RETURN_BY_TYPE(invocation, short);
    } else if (strcmp(returnType, @encode(long)) == 0) {
        RETURN_BY_TYPE(invocation, long);
    } else if (strcmp(returnType, @encode(long long)) == 0) {
        RETURN_BY_TYPE(invocation, long long);
    } else if (strcmp(returnType, @encode(unsigned char)) == 0) {
        RETURN_BY_TYPE(invocation, unsigned char);
    } else if (strcmp(returnType, @encode(unsigned int)) == 0) {
        RETURN_BY_TYPE(invocation, unsigned int);
    } else if (strcmp(returnType, @encode(unsigned short)) == 0) {
        RETURN_BY_TYPE(invocation, unsigned short);
    } else if (strcmp(returnType, @encode(unsigned long)) == 0) {
        RETURN_BY_TYPE(invocation, unsigned long);
    } else if (strcmp(returnType, @encode(unsigned long long)) == 0) {
        RETURN_BY_TYPE(invocation, unsigned long long);
    } else if (strcmp(returnType, @encode(float)) == 0) {
        RETURN_BY_TYPE(invocation, float);
    } else if (strcmp(returnType, @encode(double)) == 0) {
        RETURN_BY_TYPE(invocation, double);
    } else if (strcmp(returnType, @encode(BOOL)) == 0) {
        RETURN_BY_TYPE(invocation, BOOL);
    } else if (strcmp(returnType, @encode(char *)) == 0) {
        RETURN_BY_TYPE(invocation, const char *);
    } else {
        __autoreleasing id returnObj;
        [invocation getReturnValue:&returnObj];
        return returnObj;
    }
    
    return nil;
}
@end
