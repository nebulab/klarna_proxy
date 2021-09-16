# frozen_string_literal: true

require 'simplecov'

SimpleCov.start do
  add_filter %r{^/lib/.*/factories.rb}
  add_filter %r{^/lib/.*/version.rb}
end

if ENV['CODECOV_TOKEN']
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
else
  warn "Provide a CODECOV_TOKEN environment variable to enable Codecov uploads"
end
