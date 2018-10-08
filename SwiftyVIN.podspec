Pod::Spec.new do |s|
  s.name             = 'SwiftyVIN'
  s.version          = '1.0'
  s.summary          = 'Swift version of VIN validation'
  s.description      = <<-DESC
  Swift version of VIN validation using swift 4.2
                       DESC
 
  s.homepage         = 'https://github.com/sbhmajd/SwiftyVIN'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'Majd Sabah' => 'sbh.majd@gmail.com' }
  s.source           = { :git => 'https://github.com/sbhmajd/SwiftyVIN.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '12.0'
  s.source_files = 'SwiftyVIN/*'
 
end