Pod::Spec.new do |s|
  s.name             = 'APIVerveRandomDataGenerator'
  s.version          = '1.2.3'
  s.summary          = 'Random Data Generator produces random numbers in any range (whole or decimal, with or without repeats), dice of any size, coin flips,...'
  s.description      = <<-'DESC'
Random Data Generator produces random numbers in any range (whole or decimal, with or without repeats), dice of any size, coin flips, booleans, random strings, UUIDs, and mock names, emails, addresses and dates for application testing. Numbers, dice, coins, booleans and strings come from a cryptographically secure generator. Paid plans can generate batches up to 100 items.

This iOS/macOS SDK provides a convenient way to access the Random Data Generator from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/randomgenerator?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/randomgenerator-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveRandomDataGenerator/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
