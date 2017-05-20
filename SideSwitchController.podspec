#
# Be sure to run `pod lib lint SideSwitchController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SideSwitchController'
  s.version          = '0.0.1'
  s.summary          = 'This is the framework of a slide switch controller'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This is the framework of a slide switch controller.It is processed by pageViewController.
                       DESC

  s.homepage         = 'https://github.com/MaoJianxiang/SideSwitchController'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '毛建祥' => '15208105440@163.com' }
  s.source           = { :git => 'https://github.com/MaoJianxiang/SideSwitchController.git', :tag => '0.0.1' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SideSwitchController/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SideSwitchController' => ['SideSwitchController/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/SideSwithController.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
