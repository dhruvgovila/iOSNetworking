
Pod::Spec.new do |s|
  s.name         = "iOSNetworking"
  s.version      = "2.0.0"
  s.summary      = "This pod can be used for making networking call using URLSession"
  s.description  = <<-DESC
This pod can be used for making networking call using URLSession
                   DESC

  s.homepage     = "http://www.google.com"
  s.license      = "CopyLeft"
  s.author             = { "Govila, Dhruv" => "dhruvgovila@gmail.com" }
  s.source       = { :git => "https://github.com/dhruvgovila/iOSNetworking.git", :branch => "develop", :tag => s.version.to_s }
  s.ios.deployment_target = "11.0"
  s.swift_version     = '5.0'
  s.source_files  = "iOSNetworking/iOSNetworking/Source/Networking/**/*.swift"

  # s.subspec 'Networking' do |networking|
  #   # subspec for getting all the networking code only
  #   # by installing this pod by default only networking code should be pulled in
  # end

  s.subspec 'Image' do |image|
    image.source_files = "iOSNetworking/iOSNetworking/Source/ImageCache/**/*.swift"
  end
end
