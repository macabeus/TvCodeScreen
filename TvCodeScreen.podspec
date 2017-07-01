Pod::Spec.new do |s|
  s.name         = "TvCodeScreen"
  s.version      = "0.1.1"
  s.summary      = "Simple code screen for tvOS"
  s.homepage     = "https://github.com/getstalkr/TvCodeScreen"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Bruno Macabeus" => "bruno.macabeus@gmail.com" }

  s.tvos.deployment_target = "10.0"

  s.source       = { :git => "https://github.com/getstalkr/TvCodeScreen.git", :tag => s.version }
  s.source_files = "TvCodeScreen/TvCodeScreen/*.swift", "TvCodeScreen/TvCodeScreen/*.xib"

end
