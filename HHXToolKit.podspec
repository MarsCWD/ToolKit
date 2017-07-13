#
#  Be sure to run `pod spec lint HHXToolKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "ToolKit"
  s.version      = "0.0.1"
  s.summary      = "A short description of ToolKit."
  s.homepage     = "https://github.com/MarsCWD/ToolKit"
  s.license      = "MIT"
  s.author       = { "陈卫东" => "cwd545113097@126.com" }
  s.source_files = "Classes", "HHXToolKIt/Classes/*.{h,m}"
  s.resource 	 = 'HHXToolKIt/Images/*'
  s.source       = { :git => "https://github.com/MarsCWD/ToolKit", :tag => s.version}
  s.requires_arc = true
  s.platform     = :ios, "8.0"

end
