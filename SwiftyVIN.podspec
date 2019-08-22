Pod::Spec.new do |s|
  s.name             = 'SwiftyVIN'
  s.version          = '1.3.1'
  s.summary          = 'Swift version of VIN validation'
  s.description      = <<-DESC
  Swift version of VIN validation using swift 5.0
                       DESC
 
  s.homepage         = 'https://github.com/sbhmajd/SwiftyVIN'
  s.license          = { :type => 'MIT', :text => <<-LICENSE

    Copyright (c) 2018 Majd sbh.majd@gmail.com

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
                   LICENSE
               }
  s.author           = { 'Majd Sabah' => 'sbh.majd@gmail.com' }
  s.source           = { :git => 'https://github.com/sbhmajd/SwiftyVIN.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '11.0'
  s.source_files = 'SwiftyVIN/**/*.swift'
 
end