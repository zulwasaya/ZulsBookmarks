# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "simpleidn"
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Morten M\303\270ller Riis"]
  s.cert_chain = ["/Users/mmr/gem-public_cert.pem"]
  s.date = "2012-03-15"
  s.description = "This gem allows easy conversion from punycode ACE strings to unicode UTF-8 strings and visa versa."
  s.email = "mortenmoellerriis _AT_ gmail.com"
  s.extra_rdoc_files = ["README.rdoc", "lib/simpleidn.rb"]
  s.files = ["LICENCE", "Manifest", "README.rdoc", "Rakefile", "lib/simpleidn.rb", "simpleidn.gemspec", "spec/idn.rb", "spec/test_vectors.rb"]
  s.homepage = "http://github.com/mmriis/simpleidn"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Simpleidn", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "simpleidn"
  s.rubygems_version = "1.8.11"
  s.signing_key = "/Users/mmr/gem-private_key.pem"
  s.summary = "This gem allows easy conversion from punycode ACE strings to unicode UTF-8 strings and visa versa."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
