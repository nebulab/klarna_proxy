# frozen_string_literal: true

module Klarna
  class Configuration
    attr_accessor :environment, :country, :api_key, :api_secret, :version, :debugger, :user_agent

    def initialize
      @country = :us
      @environment = :production
      @version = :v1
      @debugger = false

      @endpoints = {
        test: 'https://api.playground.klarna.com',
        production: 'https://api.klarna.com',
        us: {
          test: 'https://api-na.playground.klarna.com',
          production: 'https://api-na.klarna.com'
        }
      }
    end

    def endpoint
      @endpoints[@country.to_sym][@environment.to_sym]
    end
  end
end
