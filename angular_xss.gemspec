$:.push File.expand_path("../lib", __FILE__)
require "angular_xss/version"

Gem::Specification.new do |s|
  s.name = 'angular_xss'
  s.version = AngularXss::VERSION
  s.authors = ["Henning Koch"]
  s.email = 'henning.koch@makandra.de'
  s.homepage = 'https://github.com/makandra/angular_xss'
  s.summary = 'Patches rails_xss so AngularJS interpolations are auto-escaped in unsafe strings.'
  s.description = s.summary
  s.license = 'MIT'
  s.metadata = {'rubygems_mfa_required' => 'true'}

  s.files = Dir['lib/**/*']
  s.test_files = Dir['spec/**/*']
  s.require_paths = ["lib"]

  s.add_dependency('activesupport', '> 5.2', '< 8.0')
end
