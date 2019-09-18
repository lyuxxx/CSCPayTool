//
//  CSCViewController.m
//  CSCPayTool
//
//  Created by lyuxxx on 09/18/2019.
//  Copyright (c) 2019 lyuxxx. All rights reserved.
//

#import "CSCViewController.h"
#import <CSCPayTool.h>

@interface CSCViewController ()

@end

@implementation CSCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)wechatPayFunc
{
    //先获取微信支付参数
    //...
    
    CSCPayTool *manager = [CSCPayTool shared];
    [manager wechatPayWithAppId:@"" partnerId:@"" prepayId:@"" package:@"" nonceStr:@"" timeStamp:@"" sign:@"" respBlock:^(NSInteger respCode, NSString *respMsg) {
        
        //处理支付结果
        
    }];
}

- (void)aliPayFunc
{
    //先获取支付宝支付参数
    //...
    
    CSCPayTool *manager = [CSCPayTool shared];
    [manager aliPayOrder:@"" scheme:@"" respBlock:^(NSInteger respCode, NSString *respMsg) {
        
        //处理支付结果
        
    }];
}

@end
