//
//  NSObject+TLKVO.h
//  Pods-Tourelle_Example
//
//  Created by 朱衡 on 2018/8/11.
//

#import <Foundation/Foundation.h>

@interface NSObject (TLKVO)

typedef void(^TLObservingBlock)(id newValue);

- (void)observeWithBlock:(TLObservingBlock)block;
- (void)removeObserve;

- (void)addObserver:(NSObject *)observer
                forKey:(NSString *)key
             withBlock:(TLObservingBlock)block;
- (void)removeBlockObserver:(NSObject *)observer forKey:(NSString *)key;
 
@property (nonatomic, weak) id owner;
@property (nonatomic, strong) NSString* keyPath;
@end
