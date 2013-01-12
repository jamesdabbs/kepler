$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kepler/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "kepler"
  s.version     = Kepler::VERSION
  s.authors     = ["James Dabbs"]
  s.email       = ["jamesdabbs@gmail.com"]
  s.homepage    = "jdabbs.com"
  s.summary     = "Kepler provides a drop-in engine for visualizing and exploring your Rails data model."
  s.description = "Kepler provides a drop-in engine for visualizing and exploring your Rails data model."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.11"
  s.add_dependency "haml-rails"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
