# frozen_string_literal: true

require 'open-uri'
require 'klarna'

Dir['./spec/support/**/*.rb'].sort.each { |file| require file }

RSpec.configure do |config|
  config.before(:each) do
    Klarna.configure do |configuration|
      configuration.api_key = 'api_key'
      configuration.api_secret = 'api_secret'
      configuration.environment = :test
    end
  end

  # Automatically wrap the test in VCR to avoid forgetting it.
  config.around(:each) do |example|
    path = example.file_path.gsub('_spec.rb', '').gsub('./spec/klarna/', '')
    description = example.full_description

    VCR.use_cassette(
      "#{path}/#{description}",
      example.metadata.fetch(:vcr, {})
    ) do
      example.call
    end
  end
end
