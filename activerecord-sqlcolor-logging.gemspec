# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activerecord/colored_log_subscriber/version'

Gem::Specification.new do |spec|
  spec.name          = "activerecord-colored_log_subscriber"
  spec.version       = Activerecord::ColoredLogSubscriber::VERSION
  spec.authors       = ["Ken Collins"]
  spec.email         = ["kcollins@customink.com"]
  spec.summary       = 'Colorized SQL Logging Backport for ActiveRecord'
  spec.description   = 'Colorized SQL Logging Backport for ActiveRecord. See http://git.io/vmlOb'
  spec.homepage      = "https://github.com/customink/activerecord-colored_log_subscriber"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency     'activerecord', '>= 3.2', '< 5.0'
  spec.add_development_dependency 'appraisal'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'
end
