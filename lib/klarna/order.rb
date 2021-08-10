# frozen_string_literal: true

module Klarna
  class Order < Client
    def get(order_id)
      do_request(:get, "/ordermanagement/v1/orders/#{order_id}")
    end

    def cancel(order_id)
      do_request(:post, "/ordermanagement/v1/orders/#{order_id}/cancel")
    end

    def capture(order_id, data)
      do_request(:post, "/ordermanagement/v1/orders/#{order_id}/captures") do |request|
        request.body = data.to_json
      end
    end

    # Use this API call to extend the expiry time of an order.

    # The possibility and length of order expiry extensions is set on a case by case basis in the contract with Klarna.

    # HTTP REQUEST
    # POST /ordermanagement/v1/orders/{order_id}/extend-authorization-time
    def extend(order_id)
      do_request(:post, "/ordermanagement/v1/orders/#{order_id}/extend-authorization-time")
    end

    # This API call is used to release the remaining authorised amount. This means you don't intend do any more captures and that the authorised amount can be returned to the customer.

    # HTTP REQUEST
    # POST /ordermanagement/v1/orders/{order_id}/release-remaining-authorization
    def release(order_id)
      do_request(:post, "/ordermanagement/v1/orders/#{order_id}/release-remaining-authorization")
    end

    # This API call is used by merchants to acknowledge the order. You will receive the order confirmation push until the order has been acknowledged.

    # HTTP REQUEST
    # POST /ordermanagement/v1/orders/{order_id}/acknowledge
    def acknowledge(order_id)
      do_request(:post, "/ordermanagement/v1/orders/#{order_id}/acknowledge")
    end
  end
end
