Pod::Spec.new do |s|
  s.name = 'Smooth'
  s.version = '0.1.0'
  s.summary = 'Interpolate number arrays'
  s.description = 'Heavily based on [Smooth.js](https://github.com/osuushi/Smooth.js/). Smoothing and interpolation number arrays.'
  s.homepage = 'https://github.com/ryohey/Smooth.swift'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'ryohey' => 'info@codingcafe.jp' }
  s.source = { :git => 'https://github.com/ryohey/Smooth.swift.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'Sources/**/*'
end