$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "genainerator"
  s.version     = "1.0"
  s.platform    = "ruby"
  s.authors     = ["Nicholas Marques"]
  s.email       = ["nnmarques97@gmail.com"]
  s.homepage    = "https://github.com/NickNish09/Gemaina"
  s.summary     = %q{A rails generator for cucumber features and steps.}
  s.description = %q{This generator will create a .feature file and a _steps.rb file related to the given feature, in any language you want}
  s.files = Dir.glob("{lib}/**/*")
  s.require_path = 'lib'
  s.add_development_dependency 'rails', '>= 3.2.0'
  s.add_development_dependency 'cucumber-rails', '>= 0'
end