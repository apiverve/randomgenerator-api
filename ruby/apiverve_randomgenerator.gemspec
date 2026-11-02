# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "apiverve_randomgenerator"
  spec.version       = "1.2.4"
  spec.authors       = ["APIVerve"]
  spec.email         = ["hello@apiverve.com"]

  spec.summary       = "Random Data Generator API - Ruby Client"
  spec.description   = "Random Data Generator produces random numbers in any range (whole or decimal, with or without repeats), dice of any size, coin flips, booleans, random strings, UUIDs, and mock names, emails, addresses and dates for application testing. Numbers, dice, coins, booleans and strings come from a cryptographically secure generator. Paid plans can generate batches up to 100 items."
  spec.homepage      = "https://apiverve.com/marketplace/randomgenerator?utm_source=ruby&utm_medium=referral&utm_content=homepage"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/apiverve/randomgenerator-API/tree/main/ruby"
  spec.metadata["changelog_uri"] = "https://apiverve.com/changelog"
  spec.metadata["documentation_uri"] = "https://docs.apiverve.com/ref/randomgenerator"

  spec.files = Dir.glob("{lib}/**/*") + %w[README.md LICENSE]
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 1.0", "< 3.0"
  spec.add_dependency "faraday-multipart", "~> 1.0"
  spec.add_dependency "json", "~> 2.0"
end
