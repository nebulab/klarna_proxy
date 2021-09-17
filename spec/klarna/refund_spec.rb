# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Klarna::Refund do
  describe '#create' do
    subject { ->(params) { Klarna.client(:refund).create("40b8f7cc-e62f-393d-9dc3-61d139a3e461", params) } }

    it 'returns a response object' do
      expect(subject.call(ORDER_REFUND))
        .to be_an_instance_of(Klarna::Response)
    end

    it 'returns an error response passing the wrong arguments' do
      expect(subject.call({}).success?).to be_falsey
    end

    it 'returns a success response passing the correct arguments' do
      response = subject.call(ORDER_REFUND)
      expect(response.success?).to be_truthy
      expect(response.headers).to include('refund-id')
    end
  end

  describe '#get' do
    subject { ->(params) { Klarna.client(:refund).get('62b809e8-b8c9-3be7-be36-80513716e7c0', params) } }

    it 'returns a response object' do
      expect(subject.call("c0cd23c3-64b9-4a49-baad-f680a038e820"))
        .to be_an_instance_of(Klarna::Response)
    end

    it 'returns an error response passing the wrong arguments' do
      expect(subject.call({}).success?).to be_falsy
    end

    it 'returns a success response passing the correct arguments' do
      response = subject.call("c0cd23c3-64b9-4a49-baad-f680a038e820")
      expect(response.success?).to be_truthy
    end
  end
end
