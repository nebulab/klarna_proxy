# frozen_string_literal: true

module Klarna
  class Configuration
    attr_accessor :environment, :country, :zone, :api_key, :api_secret, :debugger, :user_agent

    def initialize
      @country = :us
      @zone = :us
      @environment = :production
      @debugger = false

      @endpoints = {
        europe: {
          test: 'https://api.playground.klarna.com',
          production: 'https://api.klarna.com'
        },
        oceania: {
          test: 'https://api-oc.playground.klarna.com',
          production: 'https://api-oc.klarna.com'
        },
        us: {
          test: 'https://api-na.playground.klarna.com',
          production: 'https://api-na.klarna.com'
        }
      }
    end

    def endpoint
      endpoints[zone.to_sym][environment.to_sym]
    end
  end
end
