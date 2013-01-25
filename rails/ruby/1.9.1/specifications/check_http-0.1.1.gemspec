# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "check_http"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Gorsuch"]
  s.date = "2012-09-26"
  s.description = "a simple interface to gather curl stats against an HTTP resource"
  s.email = ["michael.gorsuch@gmail.com"]
  s.executables = ["check_http"]
  s.files = ["bin/check_http"]
  s.homepage = "https://github.com/gorsuch/check_http"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "a simple interface to gather curl stats against an HTTP resource"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ethon>, ["= 0.5.0"])
      s.add_runtime_dependency(%q<kv>, ["= 0.0.5"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<ethon>, ["= 0.5.0"])
      s.add_dependency(%q<kv>, ["= 0.0.5"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<ethon>, ["= 0.5.0"])
    s.add_dependency(%q<kv>, ["= 0.0.5"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
