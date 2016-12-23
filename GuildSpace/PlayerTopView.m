//
//  PlayerTopView.m
//  GuildSpace
//
//  Created by Chanel.Cheng on 15/3/25.
//  Copyright (c) 2015年 Chanel.Cheng. All rights reserved.
//

#import "PlayerTopView.h"
#import "Common.h"

#define DEFAULT_GAP 20
#define WIDTH_IMG 60
#define HEIGHT_IMG WIDTH_IMG
#define COLOR_NICKNAME [UIColor grayColor]
#define COLOR_IMG [UIColor lightGrayColor]

@interface PlayerTopView()

@property (nonatomic, strong)UIImageView *img_photo;
@property (nonatomic, strong)UILabel *lb_nickname;
//@property (nonatomic, strong)UIButton *btn_login;

@end

@implementation PlayerTopView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setupTopViewWithStatus:(BOOL)status andHeight:(CGFloat)height{
    [self setFrame:CGRectMake(0, 0, self.frame.size.width, height)];
//    [Common printRectOfView:self.contentView andIdentify:@"CELL"];
    self.img_photo = [[UIImageView alloc]initWithFrame:[Common getOrientedRectWithSuperView:self andXOrgin:DEFAULT_GAP andSize:CGSizeMake(WIDTH_IMG, HEIGHT_IMG)]];
    self.lb_nickname = [[UILabel alloc]init];
    self.lb_nickname.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:15.0];
    self.lb_nickname.textColor = COLOR_NICKNAME;
    if (!status) {
        self.img_photo.layer.backgroundColor = COLOR_IMG.CGColor;
        self.img_photo.layer.cornerRadius = WIDTH_IMG / 2;
        self.lb_nickname.text = @"请登录";
        CGSize textSize = [Common getContentSizeWithContent:self.lb_nickname.text andFont:self.lb_nickname.font];
        [self.lb_nickname setFrame:[Common getOrientedRectWithSuperView:self andXOrgin:(CGRectGetMaxX(self.img_photo.frame) + DEFAULT_GAP) andSize:textSize]];
//        self.btn_login = [[UIButton alloc]init];
//        [self.btn_login setTitle:@"点击登录" forState:UIControlStateNormal];
////        self.btn_login.titleLabel.text = @"点击登录";
//        [self.btn_login setTitleColor:COLOR_NICKNAME forState:UIControlStateNormal];
//        self.btn_login.layer.borderColor = COLOR_NICKNAME.CGColor;
//        self.btn_login.layer.borderWidth = 0.8;
//        self.btn_login.layer.backgroundColor = [UIColor clearColor].CGColor;
//        self.btn_login.titleLabel.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:14.0];
//        CGSize buttonSize = [Common getContentSizeWithContent:self.btn_login.titleLabel.text andFont:self.btn_login.titleLabel.font];
//        [self.btn_login setFrame:[Common getOrientedRectWithSuperView:self andXOrgin:self.frame.size.width - buttonSize.width - DEFAULT_GAP andSize:buttonSize]];
////        [self.btn_login addTarget:self action:@selector(gotoLoginView) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:self.btn_login];
    }else{
        self.img_photo.layer.backgroundColor = [Common getColorWithRGB:0x66ffcc].CGColor;
        self.img_photo.layer.cornerRadius = WIDTH_IMG / 2;
        self.lb_nickname.text = @"Undefined";
        CGSize textSize = [Common getContentSizeWithContent:self.lb_nickname.text andFont:self.lb_nickname.font];
        [self.lb_nickname setFrame:CGRectMake(CGRectGetMaxX(self.img_photo.frame) + DEFAULT_GAP, CGRectGetMinY(self.img_photo.frame), textSize.width, textSize.height)];
    }
    
    [self addSubview:self.img_photo];
    [self addSubview:self.lb_nickname];
}

@end
