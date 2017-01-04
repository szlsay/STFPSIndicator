Pod::Spec.new do |s|
  s.name             = 'STFPSIndicator'
  s.version          = '1.0'
  s.summary          = 'FPS检测器'
  s.description      = 'iOS屏幕FPS属性的检测器'

  s.homepage         = 'https://github.com/STShenZhaoliang'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'shentian' => '409178030@qq.com' }

  s.source           = { :git => 'https://github.com/STShenZhaoliang/STFPSIndicator.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'STFPSIndicator/*'
end
