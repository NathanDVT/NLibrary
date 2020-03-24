#
# Be sure to run `pod lib lint NLibrary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NLibrary'
  s.version          = '0.1.0'
  s.summary          = 'A short description of NLibrary.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/NathanDVT/NLibrary'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'NathanDVT' => 'nngobale@jhb.dvt.co.za' }
  s.source           = { :git => 'https://github.com/NathanDVT/NLibrary.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  s.source_files = 'NLibrary/Classes/**/*.{swift,h,m}'
#  s.static_framework = true
  # s.resource_bundles = {
  #   'NLibrary' => ['NLibrary/Assets/*.png']
  # }

   s.public_header_files = 'NLibrary/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
#  s.dependency 'Firebase'
#  s.dependency 'Firebase/Analytics'
  s.static_framework = true

  s.dependency 'Firebase'
  s.dependency 'Firebase/Core'
  s.dependency 'Firebase/Auth'
  s.dependency 'Firebase/Analytics'
  s.dependency 'Firebase/Database'
#s.dependency 'Firebase', '~> 3.0'
end
