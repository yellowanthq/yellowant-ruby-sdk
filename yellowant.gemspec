# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "yellowant/version"

Gem::Specification.new do |spec|
  spec.name          = "yellowant"
  spec.version       = Yellowant::VERSION
  spec.authors       = ["Nitin"]
  spec.email         = ["nitin@yellowant.com"]

  spec.summary       = %q{Yellowant API wrapper in ruby}
  spec.description   = %q{Yellowant API wrapper for ruby}
  spec.homepage      = "https://www.yellowant.com/api/docs"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "httparty", "~> 0.15.6"

  spec.add_dependency "httparty", "~> 0.15.6"
  spec.required_ruby_version = '>= 1.9.3'
end
