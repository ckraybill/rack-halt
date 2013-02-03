# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rack/halt/version'

Gem::Specification.new do |gem|
  gem.name          = "rack-halt"
  gem.version       = Rack::Halt::VERSION
  gem.authors       = ["Chris Kraybill"]
  gem.email         = ["ckraybill@gmail.com"]
  gem.description   = %q{Prevent matched paths from subsequent middleware calls}
  gem.summary       = %q{Stop rack requests in their tracks}
  gem.homepage      = %q{https://github.com/ckraybill/rack-halt}

  gem.files         = [
    "Gemfile",
    "LICENSE.txt",
    "Rakefile",
    "README.md",
    "lib/rack/halt.rb",
    "lib/rack/halt/rule.rb",
    "lib/rack/halt/rule_set.rb",
    "lib/rack/halt/version.rb",
    "rack-halt.gemspec"
  ]
  gem.executables   = []
  gem.test_files    = [
    "test/halt_test.rb",
    "test/rule_set_test.rb",
    "text/rule_test.rb",
    "test/test_helper.rb"
  ]
  gem.require_paths = ["lib"]

  gem.add_dependency 'rack'

  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'rack-test'
end
