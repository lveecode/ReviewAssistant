#
# Be sure to run `pod lib lint Podname.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|

s.swift_version = '5.0'

s.name             = 'ReviewAssistant'
s.version          = '0.1.3'
s.summary          = 'Use ReviewAssistant to summon StoreKits review controller without having to worry about pacing the review requests'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = <<-DESC
Use ReviewAssistant to summon StoreKits review controller without having to worry about pacing the review requests. Track recent crashes with Crashlytics (recommended), save a crash cooldown date after a crash, the app will not ask for review until that date passes. Only asks for review once per version. Never requests for review more than once a day
DESC

s.homepage         = 'https://github.com/lveecode/ReviewAssistant'
# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Lesya V' => '' }
s.source           = { :git => 'https://github.com/lveecode/ReviewAssistant.git', :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

s.ios.deployment_target = '11.0'

s.source_files = 'ReviewAssistant/Classes/**/*'

# s.resource_bundles = {
#   'ReviewAssistant' => ['ReviewAssistant/Assets/*.png']
# }

# s.public_header_files = 'Pod/Classes/**/*.h'
s.frameworks = 'UIKit', 'StoreKit'
# s.dependency 'AFNetworking', '~> 2.3'
# s.default_subspec = 'Core'

# s.subspec 'Core' do |core|
# subspec for users who only want Core features
#      core.source_files = 'Podname/Classes/Core/**/*'
# end

end
