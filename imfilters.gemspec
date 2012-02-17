$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "imfilters/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "imfilters"
  s.version     = Imfilters::VERSION
  s.authors     = ["Bojan Mihelac"]
  s.email       = ["bmihelac@mihelac.org"]
  s.homepage    = "http://source.mihelac.org"
  s.summary     = "Create named scopes for filtering"
  s.description = "Create named scopes for filtering"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.1.0", "< 4.0.0"

  s.add_development_dependency "sqlite3"
end
