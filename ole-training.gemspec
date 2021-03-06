# coding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ole_training/version'

Gem::Specification.new do |spec|
  spec.name          = "ole-training"
  spec.version       = OleTraining::Version
  spec.authors       = ["Jain Waldrip"]
  spec.email         = ["jkwaldri@iu.edu"]
  spec.summary       = %q{An OLE QA Training Project}
  spec.description   = %q{Training for OLE QA Web Application Testing with TestFactory}
  spec.homepage      = ""
  spec.license       = "ECLv2"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "headless"                    # XVFB Session-Handling Gem
  spec.add_dependency "rspec","~> 2.14.0"             # Provides expectation language
  spec.add_dependency "net-http-persistent"         # Stabilizes HTTP connections
  spec.add_dependency "cucumber"                    # Provides the main testing 
  spec.add_dependency "test-factory",">= 0.5.1"     # Provides LFM for Watir-Webdriver

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
