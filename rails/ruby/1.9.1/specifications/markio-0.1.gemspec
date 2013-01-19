# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "markio"
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tomas Varaneckas"]
  s.date = "2012-11-06"
  s.description = "Import/export utility for Netscape Bookmark Format"
  s.email = ["tomas.varaneckas@gmail.com"]
  s.homepage = "https://github.com/spajus/markio"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Handles parsing and building Netscabe Bookmark Format in Ruby way."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.11"])
      s.add_development_dependency(%q<pry-nav>, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.11"])
      s.add_dependency(%q<pry-nav>, [">= 0"])
      s.add_dependency(%q<guard-rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.11"])
    s.add_dependency(%q<pry-nav>, [">= 0"])
    s.add_dependency(%q<guard-rspec>, [">= 0"])
  end
end
