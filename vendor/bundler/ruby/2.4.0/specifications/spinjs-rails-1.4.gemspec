# -*- encoding: utf-8 -*-
# stub: spinjs-rails 1.4 ruby lib

Gem::Specification.new do |s|
  s.name = "spinjs-rails".freeze
  s.version = "1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dmytrii Nagirniak".freeze]
  s.date = "2014-09-16"
  s.description = "An animated CSS3 loading spinner with VML fallback for IE.".freeze
  s.email = ["dnagir@gmail.com".freeze]
  s.homepage = "https://github.com/dnagir/spinjs-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubyforge_project = "spinjs-rails".freeze
  s.rubygems_version = "2.6.8".freeze
  s.summary = "A spinning activity indicator for Rails 3 with no images and CSS.".freeze

  s.installed_by_version = "2.6.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>.freeze, [">= 3.1"])
    else
      s.add_dependency(%q<rails>.freeze, [">= 3.1"])
    end
  else
    s.add_dependency(%q<rails>.freeze, [">= 3.1"])
  end
end
