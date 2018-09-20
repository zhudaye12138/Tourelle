//
//  HeroViewController.m
//  Tourelle_Example
//
//  Created by 朱衡 on 2018/8/29.
//  Copyright © 2018 sczh2013@163.com. All rights reserved.
//

#import "HeroViewController.h"
#import "TLAppDelegate.h"
#import "TLUserModuleContainer.h"

@interface HeroViewController ()
@property (nonatomic, strong) UILabel *desc;
@property (nonatomic, strong) NSString *heroID;
@end

@implementation HeroViewController

-(instancetype)initWithParam:(NSDictionary *)param {
    self = [super init];
    if (self) {
        self.heroID = [param objectForKey:@"heroID"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"盲僧";
    self.desc = [UILabel new];
    self.desc.numberOfLines = 0;
    self.desc.frame = CGRectMake(30, 80, 300, 300);
    [self.view addSubview:self.desc];
    self.desc.textColor = [UIColor blueColor];
    self.desc.text = [NSString stringWithFormat:@"英雄ID = %@",self.heroID];
    
    [TLUserModuleContainer.module setUserInfo:@{@"nickName":@"newNickName"}];
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
