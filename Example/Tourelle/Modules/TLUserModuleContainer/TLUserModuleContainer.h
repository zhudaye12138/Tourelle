//
//  TLUserModuleContainer.h
//  Tourelle_Example
//
//  Created by 朱衡 on 2018/9/18.
//  Copyright © 2018 sczh2013@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TLUserModuleProtocol.h"

@interface TLUserModuleContainer : NSObject
@property (nonatomic, class ,readonly) id<TLUserModuleProtocol> module;
@end
