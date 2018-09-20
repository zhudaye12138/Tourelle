//
//  TLUserModule.h
//  Tourelle_Example
//
//  Created by 朱衡 on 2018/9/18.
//  Copyright © 2018 sczh2013@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TLUserModuleProtocol.h"
#import "TLAppLaunchHelper.h"

@interface TLUserModule : NSObject <TLUserModuleProtocol,IoCObjectProtocol>

@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *nickName;

-(void)setUserInfo:(NSDictionary *)userInfo;
@end
