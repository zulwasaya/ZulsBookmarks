# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "simpleidn"
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Morten M\u{c3}\u{b8}ller Riis"]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDRDCCAiygAwIBAgIBADANBgkqhkiG9w0BAQUFADBIMRowGAYDVQQDDBFtb3J0\nZW5tb2VsbGVycmlpczEVMBMGCgmSJomT8ixkARkWBWdtYWlsMRMwEQYKCZImiZPy\nLGQBGRYDY29tMB4XDTEwMTIwNjEzMTQ0NloXDTExMTIwNjEzMTQ0NlowSDEaMBgG\nA1UEAwwRbW9ydGVubW9lbGxlcnJpaXMxFTATBgoJkiaJk/IsZAEZFgVnbWFpbDET\nMBEGCgmSJomT8ixkARkWA2NvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC\nggEBAKtTB3aT+LG2jPkb7hfGKTpyizK6MdOZmnt2xv3dlfA+aPnpliY3QccdJE3R\nd9nNHOaQ1rrCuhBBpZu/q7nuGD8ZuMxPcqYriBzfeUv2Nsgc2XXKp9E0UIpkuxf2\nXkv26iWI7sYDzS0pCtu2of6Zw9GyVDVmB8Zf/xYQjDHDZZF6qNAVFTYvnAdl+qxb\n1VQmOmzVszc33Ic9ZtJ896QjtBPUf82FIbEYz3uy75KwDfKHM4AS85wtWEFDL0Qt\nFXGlxmq3DkNKmTPrfQ/+i2Oy8JB+OdY9ZMDsOKS17LJh+CsadQNXrp1WvZgxgo/1\nHfsXb1m+lPZZIuN3WgKCDQMAxqECAwEAAaM5MDcwCQYDVR0TBAIwADALBgNVHQ8E\nBAMCBLAwHQYDVR0OBBYEFFhp4owxGE1Gv7NPEdw7gyx6YfozMA0GCSqGSIb3DQEB\nBQUAA4IBAQAr/Vq+06hYH60Tldjc2ikzFP4q3NbMjwEMarlZTnNFXsjjNJP6uzJu\n8MV7ti/sslVKe82HUcrvFpMng2RsDHWt9YwPgWR/px8dyKoaZf1CjSf4O/qS317N\natSQvqSu+4cg5hpA87d0YIAeIEsEfWJuxmQ1jk/2Bsn/HQbLPE3vcGHF14H3U+O6\nQYZoEtohq7CjW3fqKvQ7l2/fIFiMj8vTxdualWXX0RoF3QRKIuonpaYkDO+CrLoX\ndDGWqJ1r5VRKULVNTLI6XwS0AbB93CaACN5AVFdhKOZNU1M0L4zyGWF9GMQfY74N\nPv5fihHPGcYA3voHCFu2/KGlBiF8TBQ6\n-----END CERTIFICATE-----\n"]
  s.date = "2012-03-15"
  s.description = "This gem allows easy conversion from punycode ACE strings to unicode UTF-8 strings and visa versa."
  s.email = "mortenmoellerriis _AT_ gmail.com"
  s.extra_rdoc_files = ["README.rdoc", "lib/simpleidn.rb"]
  s.files = ["README.rdoc", "lib/simpleidn.rb"]
  s.homepage = "http://github.com/mmriis/simpleidn"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Simpleidn", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "simpleidn"
  s.rubygems_version = "1.8.24"
  s.summary = "This gem allows easy conversion from punycode ACE strings to unicode UTF-8 strings and visa versa."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
