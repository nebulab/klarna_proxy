# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'

module Klarna
  class Client
    def initialize(configuration)
      @configuration = configuration
    end

    private

    def do_request(type, service)
      uri = URI.parse(@configuration.endpoint)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = case type
                when :post
                  Net::HTTP::Post.new(service)
                when :delete
                  Net::HTTP::Delete.new(service)
                when :get
                  Net::HTTP::Get.new(service)
                else
                  raise "Wrong request type <#{type}>. Allowed [:post, :delete, :get]"
                end

      request.content_type = 'application/json'
      request.basic_auth(@configuration.api_key, @configuration.api_secret)
      if @configuration.user_agent
        request['User-Agent'] =
          "Ruby Klarna #{Klarna::VERSION} (#{@configuration.user_agent} Ruby/#{RUBY_VERSION})"
      end

      yield(request) if block_given?

      http.set_debug_output(@configuration.debugger) if @configuration.debugger
      response = http.request(request)
      http.set_debug_output(nil) if @configuration.debugger

      Klarna::Response.new(response)
    end
  end
end
