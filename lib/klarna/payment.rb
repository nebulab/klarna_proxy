# frozen_string_literal: true

module Klarna
  class Payment < Client
    def create_session(data)
      do_request(:post, '/payments/v1/sessions') do |request|
        request.body = data.to_json
      end
    end

    def update_session(session_id, data)
      do_request(:post, "/payments/v1/sessions/#{session_id}") do |request|
        request.body = data.to_json
      end
    end

    def place_order(authorization_token, data)
      do_request(:post, "/payments/v1/authorizations/#{authorization_token}/order") do |request|
        request.body = data.to_json
      end
    end

    def customer_token(authorization_token, data)
      do_request(:post, "/payments/v1/authorizations/#{authorization_token}/customer-token") do |request|
        request.body = data.to_json
      end
    end
  end
end
