
Pod::Spec.new do |s|
  s.name         = "iOSNetworking"
  s.version      = "1.0"
  s.summary      = "This pod can be used for making networking call using URLSession"
  s.description  = <<-DESC
This pod can be used for making networking call using URLSession
                   DESC

  s.homepage     = "http://www.google.com"
  s.license      = "CopyLeft"
  s.author             = { "Govila, Dhruv" => "dhruvgovila@gmail.com" }
  s.source       = { :git => "https://github.com/dhruvgovila/iOSNetworking.git", :branch => "master", :tag => s.version.to_s }
  s.ios.deployment_target = "11.0"
  s.swift_version     = '4.2'
  s.source_files  = "iOSNetworking/**/*.swift"
end
