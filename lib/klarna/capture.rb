module Klarna
  class Capture < Client
    def shipping_info(order_id, capture_id, data)
      do_request(:post, "/ordermanagement/v1/orders/#{order_id}/captures/#{capture_id}/shipping-info") do |request|
        request.body = data.to_json
      end
    end
  end
end
