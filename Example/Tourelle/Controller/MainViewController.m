//
//  MainViewController.m
//  Tourelle_Example
//
//  Created by 朱衡 on 2018/9/5.
//  Copyright © 2018 sczh2013@163.com. All rights reserved.
//

#import "MainViewController.h"
#import "TLRouter.h"
#import "SVProgressHUD.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gotoHeroVC:(id)sender {
    [TLRouter openURL:@"tourelle://strategy/hero?heroID=9527" callback:^(BOOL result) {
        if (!result) {
            [SVProgressHUD showInfoWithStatus:@"打开失败"];
        }
    }];
}

- (IBAction)gotoLoginVC:(id)sender {
    [TLRouter openURL:@"InnerJump://account/login?paramA=233&paramB=hhh"];
}



@end
