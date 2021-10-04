# frozen_string_literal: true

module Klarna
  class CustomerToken < Client
    def place_order(customer_token, data)
      do_request(:post, "/customer-token/v1/tokens/#{customer_token}/order") do |request|
        request.body = data.to_json
      end
    end

    def get(customer_token)
      do_request(:get, "/customer-token/v1/tokens/#{customer_token}")
    end

    def cancel(customer_token)
      do_request(:patch, "/customer-token/v1/tokens/#{customer_token}/status") do |request|
        request.body = { status: 'CANCELLED' }.to_json
      end
    end
  end
end
