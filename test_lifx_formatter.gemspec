# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lifx_formatter/version'

Gem::Specification.new do |spec|
  spec.name          = "test_lifx_formatter"
  spec.version       = TestLifxFormatter::VERSION
  spec.authors       = ["Jose Añasco"]
  spec.email         = ["joseanasco1@gmail.com"]

  spec.summary       = %q{run your specs with the lifx bulb}
  spec.description   = %q{rspec formatter with the lifx bulb}
  spec.homepage      = "http://github.com/merongivian/test_lifx_formatter"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://mygemserver.com"
  end

  spec.add_runtime_dependency "rspec-core", "~> 3.2.3"
  spec.add_runtime_dependency "lifx", "~> 0.4.11"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2.0"
end
