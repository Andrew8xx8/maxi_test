# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'maxi_test/version'

Gem::Specification.new do |spec|
  spec.name          = "maxi_test"
  spec.version       = MaxiTest::VERSION
  spec.authors       = ["Andrew8xx8", "PlugIN73"]
  spec.email         = ["avk@8xx8.ru", "laplugin73@gmail.com"]
  spec.description   = %q{Ruby test framework (exercise)}
  spec.summary       = %q{Ruby test framework (exercise)}
  spec.homepage      = "https://github.com/Andrew8xx8/maxi_test"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
