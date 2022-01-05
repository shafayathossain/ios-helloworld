
platform :ios, '13.0'
use_frameworks!
inhibit_all_warnings!

# Fix for simulator builds on M1 mac
# https://stackoverflow.com/a/65416319
post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
end

target 'helloworld' do
  # Comment the next line if you don't want to use dynamic frameworks
  pod 'Firebase/Core'
  pod 'Firebase/Analytics', '7.9.0-k2'
  pod 'Firebase/Crashlytics', '7.9.0-k2'
  pod 'Firebase/InAppMessaging'
  use_frameworks!

  # Pods for helloworld

  target 'helloworldTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'helloworldUITests' do
    # Pods for testing
  end

end
