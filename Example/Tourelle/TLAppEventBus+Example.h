//
//  TLAppEventBus+Example.h
//  Tourelle_Example
//
//  Created by 朱衡 on 2018/8/12.
//  Copyright © 2018 sczh2013@163.com. All rights reserved.
//

#import "TLAppEventBus.h"

extern NSString * const KDidChangeStatusBarOrientation;
@interface TLAppEventBus (Example)

@property (nonatomic, strong) NSNotification * didChangeStatusBarOrientation;

@end
