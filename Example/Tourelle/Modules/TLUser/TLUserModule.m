//
//  TLUserModule.m
//  Tourelle_Example
//
//  Created by 朱衡 on 2018/9/18.
//  Copyright © 2018 sczh2013@163.com. All rights reserved.
//

#import "TLUserModule.h"
#import "TLAppLaunchHelper.h"

@interface TLUserModule()
@end

@implementation TLUserModule
-(instancetype)initWithParam:(NSDictionary *)param {
    self = [super init];
    if (self) {
        self.userID = @"testUserID";     //从数据库中读
        self.nickName = @"testNickName";  //从数据库中读
    }
    return self;
}

-(void)setUserInfo:(NSDictionary *)userInfo {
    self.nickName = [userInfo objectForKey:@"nickName"];  //从数据库中读
}


@end
