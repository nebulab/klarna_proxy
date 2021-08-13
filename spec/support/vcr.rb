# frozen_string_literal: true

require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock

  config.default_cassette_options = {
    match_requests_on: [:method],
    allow_unused_http_interactions: false,
  }

  config.before_record do |interaction|
    if interaction.request.headers['Authorization']
      interaction.request.headers['Authorization'] = '<AUTHORIZATION>'
    end
  end
end
