//
//  PlayerTopView.h
//  GuildSpace
//
//  Created by Chanel.Cheng on 15/3/25.
//  Copyright (c) 2015年 Chanel.Cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerTopView : UITableViewCell

//@property(nonatomic, strong)UINavigationController *navCtrl;

-(void)setupTopViewWithStatus:(BOOL)status andHeight:(CGFloat)height;

@end
