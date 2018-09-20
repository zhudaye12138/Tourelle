//
//  TLUserModuleProtocol.h
//  Tourelle
//
//  Created by 朱衡 on 2018/9/18.
//  Copyright © 2018 sczh2013@163.com. All rights reserved.
//

#ifndef TLUserModuleProtocol_h
#define TLUserModuleProtocol_h


@protocol TLUserModuleProtocol
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *nickName;
-(void)setUserInfo:(NSDictionary *)userInfo;
@end

#endif /* TLUserModuleProtocol_h */
