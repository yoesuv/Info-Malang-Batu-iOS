# Uncomment the next line to define a global platform for your project
platform :ios, '17.0'

target 'Info Malang Batu' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Info Malang Batu
  pod 'Alamofire', '~> 5.9.1'
  pod 'Kingfisher', '~> 7.11.0'
  pod 'GoogleMaps', '~> 8.4.0'
  pod 'Firebase/Analytics'
  pod 'AlertToast', '~> 1.3.9'

  # https://qiita.com/nakagawa1017/items/d49232cf26c6ebcb69f0
  target  'Info Malang BatuTests' do
    inherit! :search_paths
    pod 'Firebase'
end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
    end
  end
end
