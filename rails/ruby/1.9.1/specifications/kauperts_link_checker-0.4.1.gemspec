# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "kauperts_link_checker"
  s.version = "0.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Wolfgang Vogl", "Carsten Zimmermann"]
  s.date = "2012-04-15"
  s.description = "A simple library to check for the well-being of an URL"
  s.email = ["carp@hacksocke.de"]
  s.homepage = ""
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "A simple library to check for the well-being of an URL"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<i18n>, [">= 0"])
      s.add_runtime_dependency(%q<simpleidn>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<redgreen>, [">= 0"])
      s.add_development_dependency(%q<activesupport>, [">= 0"])
    else
      s.add_dependency(%q<i18n>, [">= 0"])
      s.add_dependency(%q<simpleidn>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<redgreen>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 0"])
    end
  else
    s.add_dependency(%q<i18n>, [">= 0"])
    s.add_dependency(%q<simpleidn>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<redgreen>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 0"])
  end
end
