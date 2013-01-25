# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "link_thumbnail"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Toby Matejovsky"]
  s.date = "2011-03-24"
  s.description = "Given a URL, retrieves thumbnail images (similar to when you share a link on Facebook or Digg)."
  s.email = ["toby.matejovsky@gmail.com"]
  s.homepage = "https://github.com/tobym/link_thumbnail"
  s.require_paths = ["lib"]
  s.rubyforge_project = "link_thumbnail"
  s.rubygems_version = "1.8.24"
  s.summary = "Retrieve thumbnail images for a given URL."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>, ["~> 1.4.0"])
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.4.0"])
      s.add_runtime_dependency(%q<ruby-readability>, ["~> 0.2.3"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
    else
      s.add_dependency(%q<json>, ["~> 1.4.0"])
      s.add_dependency(%q<nokogiri>, ["~> 1.4.0"])
      s.add_dependency(%q<ruby-readability>, ["~> 0.2.3"])
      s.add_dependency(%q<mocha>, [">= 0"])
    end
  else
    s.add_dependency(%q<json>, ["~> 1.4.0"])
    s.add_dependency(%q<nokogiri>, ["~> 1.4.0"])
    s.add_dependency(%q<ruby-readability>, ["~> 0.2.3"])
    s.add_dependency(%q<mocha>, [">= 0"])
  end
end
