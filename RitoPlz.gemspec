# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'RitoPlz/version'

Gem::Specification.new do |spec|
  spec.name          = "RitoPlz"
  spec.version       = RitoPlz::VERSION
  spec.authors       = ["Luke Jones"]
  spec.email         = ["manhappylife@yahoo.ca"]

  spec.summary       = %q{A simple riot api wrapper with the aim of being easy to use and well documented.}
  spec.description   = %q{The aim of RitoPlz is to provide a simple, clean, and easy to use ruby API wrapper. My priority is to provide a gem that is well documented and that you should never get frustrated with. If I fail to meet these goals please open a bug report in GitHub so I can fix the problem.}
  spec.homepage      = "http://github.com/gjh33/RitoPlz"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
end
