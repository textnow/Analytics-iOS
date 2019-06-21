#
# Be sure to run `pod lib lint AnalyticLayer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AnalyticLayer'
  s.version          = '1.0.0'
  s.summary          = 'Easily wrap any analytic logging tool to provide a layer between your app and the tools that you use.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Analytics is essential for the continued improvement of apps. There are many tools to help you gather information, but they are constantly evolving. 
To handle that constant development, we have created this analytic framework to prevent horizontal change across your app. 
If you are looking for a simple, modular, testable, and mockable layer for your analytic tools that minimises impact on the rest of your app, you've come to right place.
                       DESC

  s.homepage         = 'https://github.com/textnow/Analytics-iOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Quinton' => 'quintonpryce@gmail.com' }
  s.source           = { :git => 'https://github.com/textnow/Analytics-iOS.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.swift_version = '5.0'
  s.source_files = 'AnalyticLayer/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AnalyticLayer' => ['AnalyticLayer/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
