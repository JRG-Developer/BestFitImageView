Pod::Spec.new do |s|
  s.platform     = :ios
  s.ios.deployment_target = '7.0'
  s.name         = "BestFitImageView"
  s.version      = "1.1.0"
  s.summary      = "BestFitImageView automatically selects the best contentMode by comparing the image size to the frame size."
  s.homepage     = "https://github.com/JRG-Developer/BestFitImageView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Joshua Greene" => "jrg.developer@gmail.com" }
  s.source   	   = { :git => "https://github.com/JRG-Developer/BestFitImageView.git",
                     :tag => "#{s.version}"}
  s.requires_arc = true
  s.framework = "UIKit"

  s.source_files = "BestFitImageView/*{h,m}"
end
