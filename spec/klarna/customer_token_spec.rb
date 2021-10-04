# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Klarna::CustomerToken do
  describe '#place_order' do
    subject { ->(customer_token, params) { Klarna.client(:customer_token).place_order(customer_token, params) } }

    it 'returns a response object' do
      response = subject.call('91532188-4b48-4fe7-b075-16b95da53da9', CUSTOMER_TOKEN_PLACE_ORDER)
      expect(response.success?).to be_truthy
      expect(response).to be_an_instance_of(Klarna::Response)
    end

    it 'returns an error response passing the wrong arguments' do
      expect(subject.call('91532188-4b48-4fe7-b075-16b95da53da9', {}).success?)
        .to be_falsey
    end

    it 'returns a success response passing the correct arguments' do
      response = subject.call('91532188-4b48-4fe7-b075-16b95da53da9', CUSTOMER_TOKEN_PLACE_ORDER)
      expect(response.body).to include('order_id')
    end
  end
end
