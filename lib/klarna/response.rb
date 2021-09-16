# frozen_string_literal: true

module Klarna
  class Response
    attr_reader :code, :body, :http_response, :headers

    def initialize(http_response)
      @http_response = http_response
      @code = http_response.code.to_i
      @body = parse_body
      @headers = http_response.to_hash
    end

    def success?
      @code < 300
    end

    def error?
      @code >= 300
    end

    def [](index)
      http_response.send('[]', index)
    end

    def method_missing(method, *args, &block)
      return @body[method.to_s] if body_field?(method)

      super
    end

    def respond_to_missing?(method, *args, &block)
      return true if body_field?(method)

      super
    end

    def error_code
      return @body['error_code'] if body_field?('error_code')

      @code.to_s
    end

    private

    def parse_body
      return nil if @http_response.body.nil? || @http_response.body.empty?

      case @http_response.content_type
      when 'application/json'
        JSON.parse(@http_response.body)
      when 'text/html'
        http_response.body
      else
        http_response.body
      end
    end

    def body_field?(field)
      @body.is_a?(Hash) && @body.key?(field.to_s)
    end
  end
end
