//
//  ViewController.m
//  GuildSpace
//
//  Created by Chanel.Cheng on 15/3/18.
//  Copyright (c) 2015年 Chanel.Cheng. All rights reserved.
//

#import "ViewController.h"
#import "Common.h"
#import "AppDelegate.h"
#import "SignUpViewController.h"
#import "TabBarViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView{
    self.view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
}

- (void)initView{
//    self.view.backgroundColor = [UIColor lightGrayColor];
    id firstOpenFlag = [[NSUserDefaults standardUserDefaults] objectForKey:@"firstOpenFlag"];
    if (firstOpenFlag == nil) {
        [self showSignUp];
//        [self showMain];
    }else{
        [self showMain];
        NSString *filePath = [FileManager getFullDocumentPath:LOGINSTATUS];
        NSMutableDictionary *userData = [[NSMutableDictionary alloc]initWithContentsOfFile:filePath];
//        NSLog(@"%s || 从文件读取的登陆账号信息:%@", __FUNCTION__, userData);
        [[Common sharedCommon]setUserWithUsername:[userData objectForKey:@"username"] andUser_id:[[userData objectForKey:@"id"] integerValue] andPhone:[userData objectForKey:@"phone"]];
        NSLog(@"%s || 登陆用户信息：%@", __FUNCTION__, [[Common sharedCommon]getCurrentUser]);
    }
}

- (void)showMain{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [self.view removeFromSuperview];
    TabBarViewController *tabBarViewCtrl = [[TabBarViewController alloc]init];
    [appDelegate.window setRootViewController:tabBarViewCtrl];
}

- (void)showSignUp{
    AppDelegate * appDelegate = [UIApplication sharedApplication].delegate;
//    [self.view removeFromSuperview];
    SignUpViewController *signUpViewCtrl = [[SignUpViewController alloc]init];
//    [self.view addSubview:signUpViewCtrl.view];
    appDelegate.window.rootViewController = signUpViewCtrl;
    [appDelegate.window setRootViewController:signUpViewCtrl];
}

@end
