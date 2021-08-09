module Klarna
  class Refund < Client
    # This API call is used to refund an amount of a captured order. The refunded amount will be credited to the customer.

    # The refunded amount must not be higher than captured_amount. The refunded amount can be accompanied by a descriptive text and order lines.

    # Note: The response code can vary (by region or by context). Never check for 201 or 204 specifically, use a more general check for 2xx responses.

    # HTTP REQUEST
    # POST /ordermanagement/v1/orders/{order_id}/refunds
    def create(order_id, data)
      do_request(:post, "/ordermanagement/v1/orders/#{order_id}/refunds")do |request|
        request.body = data.to_json
      end
    end

    # This API call is used to read information on a refund.

    # HTTP REQUEST
    # GET /ordermanagement/v1/orders/{order_id}/refunds/{refund_id}
    def get(order_id, refund_id)
      do_request(:get, "/ordermanagement/v1/orders/#{order_id}/refunds/#{refund_id}")
    end

  end
end
