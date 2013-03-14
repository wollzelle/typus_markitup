# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "markitup/version"


Gem::Specification.new do |gem|
  gem.authors       = ["TODO: Write your name"]
  gem.email         = ["TODO: Write your email address"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "typus_markitup"
  gem.require_paths = ["lib"]
  gem.version       = Typus::Markitup::VERSION

  gem.add_dependency "rails", ">= 3.1.3"
  gem.add_dependency "typus"

end
