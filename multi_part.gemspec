# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'multi_part/version'

Gem::Specification.new do |spec|
  spec.name          = "multi_part"
  spec.version       = MultiPart::VERSION
  spec.authors       = ["Mohanraj R"]
  spec.email         = ["mohanraj.ramanujam@gmail.com"]
  spec.description   = %q{Multipart form post}
  spec.summary       = %q{Multipart form post}
  spec.homepage      = "https://github.com/mohanraj-ramanujam/multi_part"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
