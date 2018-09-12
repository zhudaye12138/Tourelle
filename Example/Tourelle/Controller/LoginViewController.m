//
//  LoginViewController.m
//  Tourelle_Example
//
//  Created by 朱衡 on 2018/8/29.
//  Copyright © 2018 sczh2013@163.com. All rights reserved.
//

#import "LoginViewController.h"
#import "TLAppDelegate.h"

@interface LoginViewController ()
@property (nonatomic, strong) UILabel *desc;
@property (nonatomic, strong) NSDictionary *param;
@end

@implementation LoginViewController

-(instancetype)initWithParam:(NSDictionary *)param {
    self = [super init];
    if (self) {
        self.param = param;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"登录";
    self.desc = [UILabel new];
    self.desc.numberOfLines = 0;
    self.desc.frame = CGRectMake(30, 80, 300, 300);
    [self.view addSubview:self.desc];
    self.desc.textColor = [UIColor blueColor];
    self.desc.text = [self.param description];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)presentingSelf {
    UINavigationController *rootVC = (UINavigationController *) APPWINDOW.rootViewController;
    
    if (rootVC) {
        [rootVC pushViewController:self animated:YES];
        return YES;
    }
    return NO;
}

@end
