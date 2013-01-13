$:.push File.expand_path("../lib", __FILE__)

require "kepler/version"

Gem::Specification.new do |s|
  s.name        = "kepler"
  s.version     = Kepler::VERSION
  s.authors     = ["James Dabbs"]
  s.email       = ["jamesdabbs@gmail.com"]
  s.homepage    = "jdabbs.com"
  s.summary     = "Kepler provides a drop-in engine for visualizing and exploring your Rails data model."
  s.description = "Kepler provides a drop-in engine for visualizing and exploring your Rails data model."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.11"
  s.add_dependency "haml-rails"
  s.add_dependency "railroady"
end
