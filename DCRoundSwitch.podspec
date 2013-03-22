Pod::Spec.new do |s|
  s.name         = "DCRoundSwitch"
  s.version      = "0.0.1"
  s.summary      = "A 'modern' replica of UISwitch."
  s.homepage     = "https://github.com/domesticcatsoftware/DCRoundSwitch"
  s.license      = 'MIT'
  s.author       = { "Patrick Richards" => "contact@domesticcat.com.au" }
  s.source       = { :git => "https://github.com/domesticcatsoftware/DCRoundSwitch.git", :branch => "master" }
  s.platform     = :ios
  s.source_files = 'DCRoundSwitch/*'
  s.frameworks   = 'QuartzCore'
end
