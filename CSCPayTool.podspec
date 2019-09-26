#
# Be sure to run `pod lib lint CSCPayTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CSCPayTool'
  s.version          = '0.2.0'
  s.summary          = '微信，支付宝支付'

  s.description      = <<-DESC
微信支付宝支付封装
                       DESC

  s.homepage         = 'https://github.com/lyuxxx/CSCPayTool'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lyuxxx' => 'lyxiel@163.com' }
  s.source           = { :git => 'https://github.com/lyuxxx/CSCPayTool.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'

  s.source_files = 'CSCPayTool/*.{h,m}'
  s.public_header_files = "CSCPayTool/CSCPayTool.h"
  s.requires_arc = true

  s.dependency "XXWeChatSDK"
  s.dependency "XXAlipaySDK"
end
