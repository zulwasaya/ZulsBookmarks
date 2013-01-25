# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ruby-readability"
  s.version = "0.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrew Cantino", "starrhorne", "libc", "Kyle Maxwell"]
  s.date = "2011-01-26"
  s.description = "Port of arc90's readability project to ruby"
  s.email = "andrew@iterationlabs.com"
  s.executables = ["readability"]
  s.extra_rdoc_files = ["README"]
  s.files = ["bin/readability", "README"]
  s.homepage = "http://github.com/iterationlabs/ruby-readability"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Port of arc90's readability project to ruby"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.4.2"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_dependency(%q<nokogiri>, [">= 1.4.2"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
    s.add_dependency(%q<nokogiri>, [">= 1.4.2"])
  end
end
