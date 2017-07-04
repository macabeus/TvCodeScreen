# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
workspace './TvCodeScreen.xcworkspace'

target 'TvCodeScreen' do
  project 'TvCodeScreen/TvCodeScreen.xcodeproj'

  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  target 'TvCodeScreenTests' do
    pod 'Quick'
    pod 'Nimble'
  end
end

target 'Example' do
  project 'Example/Example.xcodeproj'

  use_frameworks!

  pod 'TvCodeScreen', :path => '.'
end
