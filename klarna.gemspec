# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'klarna/version'

Gem::Specification.new do |spec|
  spec.name          = 'klarna_client'
  spec.version       = Klarna::VERSION
  spec.authors       = ['Jose Antonio Pio Gil', 'Pascal Jungblut']
  spec.email         = ['jose.pio@bitspire.de', 'pascal.jungblut@bitspire.de']

  spec.summary       = 'Klarna Ruby Client'
  spec.description   = 'Provides a Ruby interface to the current Klarna API'
  spec.homepage      = ''
  spec.license       = 'Apache-2.0'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.2'

  spec.add_development_dependency 'bundler', '~> 2.1.4'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'capybara-screenshot'
  spec.add_development_dependency 'httplog'
  spec.add_development_dependency 'json'
  spec.add_development_dependency 'poltergeist'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-doc'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'sinatra-contrib'
  spec.add_development_dependency 'thin'
  spec.add_development_dependency 'webmock', '~> 3.8'
  spec.add_development_dependency 'vcr', '~> 5.1'
end
