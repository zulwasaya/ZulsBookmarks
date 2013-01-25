# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "duck-duck-go"
  s.version = "1.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["andrewrjones"]
  s.date = "2012-07-02"
  s.description = "A Ruby library to access the DuckDuckGo Zero Click Info API."
  s.email = "andrew@arjones.co.uk"
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = ["LICENSE", "README.rdoc"]
  s.homepage = "https://github.com/andrewrjones/ruby-duck-duck-go"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Access the DuckDuckGo Zero Click Info API"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httpclient>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
    else
      s.add_dependency(%q<httpclient>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
    end
  else
    s.add_dependency(%q<httpclient>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
  end
end
