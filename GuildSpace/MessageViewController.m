//
//  MessageViewController.m
//  GuildSpace
//
//  Created by Chanel.Cheng on 15/3/19.
//  Copyright (c) 2015年 Chanel.Cheng. All rights reserved.
//

#import "MessageViewController.h"
#import "Common.h"

@interface MessageViewController ()<UIAlertViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController.navigationBar setBarTintColor:[Common getColorWithRGB:0x66ccff]];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    
    UIBarButtonItem *btn_right = [[UIBarButtonItem alloc]initWithTitle:@"新增" style:UIBarButtonItemStyleDone target:self action:@selector(gotoAddMessage)];
    btn_right.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = btn_right;
    
    UIBarButtonItem *btn_left = [[UIBarButtonItem alloc]initWithTitle:@"清空" style:UIBarButtonItemStyleDone target:self action:@selector(cleanMessages)];
    btn_left.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = btn_left;
    
    self.navigationItem.title = @"消息";
    
    [self initTableView];
    
    [self doDownloadImage];
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

- (void)initTableView{
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectZero];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"cell%ld", indexPath.row]];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:[NSString stringWithFormat:@"cell%ld", indexPath.row]];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)cleanMessages{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"清空所有记录" message:@"是否确认清空所有聊天记录？" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Confirm", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
}

- (void)gotoAddMessage{
    
}

- (void) doDownloadImage {
    NSURL * url = [NSURL URLWithString:@"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/logo_white_fe6da1ec.png"];
    NSURLSessionDownloadTask * downloadTask = [[NSURLSession sharedSession] downloadTaskWithURL:url completionHandler: ^(NSURL *location, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        } else {
            if (location) {
                NSLog(@"response: %@ and location: %@", response, location);
                UIImage * downloadedImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
                if (downloadedImage) {
                    UIImageView * imageView = [[UIImageView alloc]initWithImage:downloadedImage];
                    imageView.frame = self.view.bounds;
                    [self.view addSubview:imageView];
                    self.view.backgroundColor = [UIColor lightGrayColor];
                } else {
                    NSLog(@"down loaed image failed.");
                }
            } else {
                NSLog(@"location is empty.");
            }
        }
    }];
    [downloadTask resume];
}

@end
