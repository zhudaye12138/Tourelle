//
//  TLAppDelegate.h
//  Tourelle
//
//  Created by sczh2013@163.com on 08/12/2018.
//  Copyright (c) 2018 sczh2013@163.com. All rights reserved.
//

@import UIKit;

#define APPEDELEGATE       ((TLAppDelegate *)[[UIApplication sharedApplication] delegate])
#define APPWINDOW       [APPEDELEGATE window]


@interface TLAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
