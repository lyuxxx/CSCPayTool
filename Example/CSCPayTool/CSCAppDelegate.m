//
//  CSCAppDelegate.m
//  CSCPayTool
//
//  Created by lyuxxx on 09/18/2019.
//  Copyright (c) 2019 lyuxxx. All rights reserved.
//

#import "CSCAppDelegate.h"
#import <CSCPayTool.h>

@implementation CSCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [CSCPayTool wechatRegisterAppWithAppId:@"" universalLink:@""];
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    NSString *fromBundleId = options[UIApplicationOpenURLOptionsSourceApplicationKey];
    if ([fromBundleId isEqualToString:@"com.tencent.xin"]) {
        if ([[url absoluteString] containsString:@"pay"]) {
            //WeChat Pay
            return [CSCPayTool wechatHandleOpenURL:url];
        } else {
            //WeChat Share
        }
    } else if ([url.scheme hasPrefix:@"safepay"]) {
        return [CSCPayTool alipayHandleOpenURL:url];
    }
    return YES;
}

@end
