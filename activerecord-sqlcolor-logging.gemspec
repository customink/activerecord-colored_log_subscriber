# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activerecord/sqlcolor/logging/version'

Gem::Specification.new do |spec|
  spec.name          = "activerecord-sqlcolor-logging"
  spec.version       = Activerecord::Sqlcolor::Logging::VERSION
  spec.authors       = ["Ken Collins"]
  spec.email         = ["kcollins@customink.com"]
  spec.summary       = 'Colorized SQL Logging Backport for ActiveRecord'
  spec.description   = 'Colorized SQL Logging Backport for ActiveRecord. See http://git.io/vmlOb'
  spec.homepage      = "activerecord-sqlcolor-logging"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
