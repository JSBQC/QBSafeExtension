#
# Be sure to run `pod lib lint QBSafeExtension.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QBSafeExtension'
  s.version          = '1.0.6'
  s.summary          = "NSURL、NSArray、NSMutableArray、NSDictionary和NSMutableDictionary添加分类，防止崩溃"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description  = <<-DESC
    TODO: 对NSURL、NSArray、NSMutableArray、NSDictionary和NSMutableDictionary添加分类，防止因为添加nil对象造成崩溃，只在DEBUG模式下直接暴露问题
                   DESC

  s.homepage         = 'https://github.com/JSBQC/QBSafeExtension'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'QB' => 'sobluewhat@163.com' }
  s.source           = { :git => 'https://github.com/JSBQC/QBSafeExtension.git', :tag => s.version }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'QBSafeExtension/Classes/**/*'
  
  # s.resource_bundles = {
  #   'QBSafeExtension' => ['QBSafeExtension/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
