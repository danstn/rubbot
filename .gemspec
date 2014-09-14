VERSION = '0.1.0'

Gem::Specification.new do |spec|
  spec.name           = 'rubbot'
  spec.version        = VERSION
  spec.date           = Date.today.to_s
  spec.summary        = 'Toy Robot simulation.'
  spec.description    = 'Toy Robot simulation implementation in Ruby.'
  spec.authors        = ['Daniel Stankevich']
  spec.email          = 'standeo@gmail.com'
  spec.files          = Dir['lib/**/*.rb']
  spec.bindir         = 'bin'
  spec.homepage       = 'http://rubygems.org/gems/rubbot'
  spec.license        = 'MIT'

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'turnip'
  spec.add_development_dependency 'simplecov'

  spec.executables << 'rubbot'
end
