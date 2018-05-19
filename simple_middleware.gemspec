
# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "simple_middleware/version"

Gem::Specification.new do |spec|
  spec.name          = "simple_middleware"
  spec.version       = SimpleMiddleware::VERSION
  spec.authors       = ["Tim Rogers"]
  spec.email         = ["tim@gocardless.com"]

  spec.summary       = "A simple implementation of the middleware pattern in Ruby for " \
                       'my talk "Miles more maintainable: building APIs with the ' \
                       'middleware pattern"'
  spec.homepage      = "https://github.com/timrogers/simple_middleware"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "immutable-ruby", "~> 0.0.2"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "gc_ruboconfig", "~> 2.3.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec_junit_formatter", "~> 0.3.0"
end
