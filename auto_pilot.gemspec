# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'auto_pilot/version'

Gem::Specification.new do |spec|
  spec.name          = "auto_pilot"
  spec.version       = AutoPilot::VERSION
  spec.authors       = ["Luke Fender"]
  spec.email         = ["lfender6445@gmail.com"]
  spec.summary       = %q{Convert your stackoverflow to a github blog}
  spec.description   = %q{Convert your stackoverflow to a github blog}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency 'rake', '~> 10.3.2'
  spec.add_development_dependency 'minitest', '~> 5.4.1'
  spec.add_development_dependency 'webmock', '~> 1.18.0'
end
