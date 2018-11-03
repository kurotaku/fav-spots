# -*- encoding: utf-8 -*-
# stub: carrierwave-ftp 0.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "carrierwave-ftp".freeze
  s.version = "0.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Luan Santos".freeze]
  s.date = "2018-03-01"
  s.description = "Allows file upload using FTP for CarrierWave uploaders.".freeze
  s.email = ["luan@luansantos.com".freeze]
  s.homepage = "https://github.com/luan/carrierwave-ftp".freeze
  s.licenses = ["MIT".freeze]
  s.rubyforge_project = "carrierwave-ftp".freeze
  s.rubygems_version = "2.6.8".freeze
  s.summary = "FTP support for CarrierWave".freeze

  s.installed_by_version = "2.6.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<carrierwave>.freeze, [">= 0.6.2"])
      s.add_runtime_dependency(%q<net-sftp>.freeze, ["~> 2.1.2"])
      s.add_runtime_dependency(%q<double-bag-ftps>.freeze, ["= 0.1.3"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.14"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.3"])
    else
      s.add_dependency(%q<carrierwave>.freeze, [">= 0.6.2"])
      s.add_dependency(%q<net-sftp>.freeze, ["~> 2.1.2"])
      s.add_dependency(%q<double-bag-ftps>.freeze, ["= 0.1.3"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2.14"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.3"])
    end
  else
    s.add_dependency(%q<carrierwave>.freeze, [">= 0.6.2"])
    s.add_dependency(%q<net-sftp>.freeze, ["~> 2.1.2"])
    s.add_dependency(%q<double-bag-ftps>.freeze, ["= 0.1.3"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.14"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.3"])
  end
end
