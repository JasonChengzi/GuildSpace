//
//  PersonalCardViewController.m
//  GuildSpace
//
//  Created by Chanel.Cheng on 15/05/28.
//  Copyright (c) 2015年 Chanel.Cheng. All rights reserved.
//

#import "PersonalCardViewController.h"
#import "Common.h"

@interface PersonalCardViewController ()

@end

@implementation PersonalCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.navigationItem.title = @"用户详情";
    
    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Avatars_big.png"]];
//    [imgView setFrame:CGRectMake(20, 160, imgView.image.size.width, imgView.image.size.height)];
    [imgView setFrame:[Common getOrientedRectWithSuperView:self.view andXOrgin:30 andSize:imgView.image.size]];
    [self.view addSubview:imgView];
    
    CGSize size_username = [Common getContentSizeWithContent:self.username andFont:[UIFont systemFontOfSize:16.0]];
    
    UILabel *lb_username = [[UILabel alloc]initWithFrame:[Common getOrientedRectWithSuperView:self.view andXOrgin:CGRectGetMaxX(imgView.frame) + 30 andSize:size_username]];
    lb_username.font = [UIFont systemFontOfSize:16.0];
    lb_username.text = self.username;
    lb_username.textColor = [UIColor whiteColor];
    [self.view addSubview:lb_username];
    
    UIButton *btn_newChat = [[UIButton alloc]init];
    [btn_newChat setTitle:@"发送消息" forState:UIControlStateNormal];
    CGSize size_btn1 = [Common getContentSizeWithContent:btn_newChat.titleLabel.text andFont:btn_newChat.titleLabel.font];
    [btn_newChat setFrame:CGRectMake(self.view.frame.size.width / 4 - size_btn1.width / 2, self.view.frame.size.height - 40 - size_btn1.height, size_btn1.width, size_btn1.height)];
    [self.view addSubview:btn_newChat];
    
    UIButton *btn_addFollow = [[UIButton alloc]init];
    [btn_addFollow setTitle:@"关注" forState:UIControlStateNormal];
    CGSize size_btn2 = [Common getContentSizeWithContent:btn_addFollow.titleLabel.text andFont:btn_addFollow.titleLabel.font];
    [btn_addFollow setFrame:CGRectMake(self.view.frame.size.width * 0.75 - size_btn2.width / 2, self.view.frame.size.height - 40 - size_btn2.height, size_btn2.width, size_btn2.height)];
    [self.view addSubview:btn_addFollow];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
