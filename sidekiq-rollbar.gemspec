# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sidekiq/rollbar/version'

Gem::Specification.new do |spec|
  spec.name          = "sidekiq-rollbar"
  spec.version       = Sidekiq::Rollbar::VERSION
  spec.authors       = ["Allen Wei"]
  spec.email         = ["digruby@gmail.com"]
  spec.description   = %q{Report to Rollbar when sidekiq raise exception}
  spec.summary       = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rollbar"
  spec.add_runtime_dependency "sidekiq"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
