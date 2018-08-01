require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name = "react-native-textinput-ios"
  s.version = package['version']
  s.summary = "Bridge files of iOS native textfield"

  s.authors = { "QiaoYiFei" => "yifei239@126.com" }
  s.homepage = "https://github.com/Eaffy/react-native-textinput-ios"
  s.license = "MIT"

  s.platform = :ios, "8.0"
  s.framework    = 'UIKit'
  s.requires_arc = true

  s.source = { :git => "https://github.com/Eaffy/react-native-textinput-ios.git" }
  s.source_files = "RNGTextField/*.{h,m}"

end