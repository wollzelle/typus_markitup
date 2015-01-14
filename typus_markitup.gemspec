# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "markitup/version"


Gem::Specification.new do |gem|
  gem.authors       = ["Karl Horky"]
  gem.email         = ["team@wollzelle.com"]
  gem.description   = %q{Typus markItUp! module}
  gem.summary       = %q{A Typus module to add a markup editor to any textarea}
  gem.homepage      = "http://wollzelle.com"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "typus_markitup"
  gem.require_paths = ["lib"]
  gem.version       = Typus::Markitup::VERSION

  gem.add_dependency "rails", ">= 3.1.3"
  gem.add_dependency "typus"
  gem.add_dependency "jquery-rails"
  gem.add_dependency "backbone-on-rails"
end
