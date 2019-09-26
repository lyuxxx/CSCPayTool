//
//  CSCPayTool.h
//  CSCPayTool
//
//  Created by liuyuxuan on 2019/9/18.
//

#import <Foundation/Foundation.h>

#import <WXApi.h>
#import <WechatAuthSDK.h>

#import <AlipaySDK/AlipaySDK.h>

NS_ASSUME_NONNULL_BEGIN

/**
 支付回调block

 @param respCode
 0    -    支付成功
 -1   -    支付失败
 -2   -    支付取消
 -3   -    未安装App(适用于微信)
 -99  -    未知错误
 @param respMsg 返回信息
 */
typedef void(^CSCPayToolRespBlock)(NSInteger respCode, NSString *respMsg);

@interface CSCPayTool : NSObject <WXApiDelegate>

+ (CSCPayTool *)shared;

#pragma mark - WeChat Pay

/**
 微信支付结果回调
 */
@property (nonatomic, copy) CSCPayToolRespBlock wechatRespBlock;

/**
 检查是否安装微信

 @return 是否安装微信
 */
+ (BOOL)isWeChatAppInstalled;

/**
 注册微信appId

 @param appId appId
 @param universalLink universalLink
 @return return value
 */
+ (BOOL)wechatRegisterAppWithAppId:(NSString *)appId universalLink:(NSString *)universalLink;

/**
 处理微信通过URL启动App时传递回来的数据

 @param url URL
 @return 返回值
 */
+ (BOOL)wechatHandleOpenURL:(NSURL *)url;

/**
 发起微信支付
 
 @param appId appId
 @param partnerId partnerId
 @param prepayId prepayId
 @param package package
 @param nonceStr nonceStr
 @param timeStamp timeStamp
 @param sign sign
 @param block block
 */
- (void)wechatPayWithAppId:(NSString *)appId
                 partnerId:(NSString *)partnerId
                  prepayId:(NSString *)prepayId
                   package:(NSString *)package
                  nonceStr:(NSString *)nonceStr
                 timeStamp:(NSString *)timeStamp
                      sign:(NSString *)sign
                 respBlock:(CSCPayToolRespBlock)block;

#pragma mark - Alipay

/**
 支付宝结果回调
 */
@property (nonatomic, copy) CSCPayToolRespBlock alipayRespBlock;

/**
 处理支付宝通过URL启动App时传递回来的数据

 @param url URL
 @return 返回值
 */
+ (BOOL)alipayHandleOpenURL:(NSURL *)url;

/**
 发起支付宝支付
 
 @param order order
 @param scheme scheme
 @param block block
 */
- (void)aliPayOrder:(NSString *)order
             scheme:(NSString *)scheme
          respBlock:(CSCPayToolRespBlock)block;

@end

NS_ASSUME_NONNULL_END
