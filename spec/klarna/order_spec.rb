# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Klarna::Order do
  describe '#get' do
    subject { ->(params) { Klarna.client(:order).get(params) } }

    it 'returns a response object' do
      expect(subject.call("eab63d8c-e5d9-393e-bf8e-9dcd968d1332"))
        .to be_an_instance_of(Klarna::Response)
    end

    it 'returns an error response passing the wrong arguments' do
      expect(subject.call("").success?).to be_falsey
    end

    it 'returns a success response passing the correct arguments' do
      response = subject.call("eab63d8c-e5d9-393e-bf8e-9dcd968d1332")
      expect(response.success?).to be_truthy
      expect(response.body).to include('order_id')
    end
  end

  describe '#cancel' do
    subject { ->(params) { Klarna.client(:order).cancel(params) } }

    it 'returns a response object' do
      expect(subject.call("eab63d8c-e5d9-393e-bf8e-9dcd968d1332"))
        .to be_an_instance_of(Klarna::Response)
    end

    it 'returns an error response passing the wrong arguments' do
      expect(subject.call({}).success?).to be_falsy
    end

    it 'returns a success response passing the correct arguments' do
      response = subject.call("eab63d8c-e5d9-393e-bf8e-9dcd968d1332")
      expect(response.success?).to be_truthy
    end
  end

  describe '#capture' do
    subject { ->(params) { Klarna.client(:order).capture("f5b2b1b3-4d70-39a7-8d30-86470631eee3", params) } }

    it 'returns a response object' do
      expect(subject.call(ORDER_CAPTURE))
        .to be_an_instance_of(Klarna::Response)
    end

    it 'returns an error response passing the wrong arguments' do
      expect(subject.call({}).success?).to be_falsy
    end

    it 'returns a success response passing the correct arguments' do
      response = subject.call(ORDER_CAPTURE)
      expect(response.success?).to be_truthy
    end
  end

  describe '#extend' do
    subject { ->(order_id) { Klarna.client(:order).extend(order_id) } }

    it 'returns a response object' do
      expect(subject.call("36b50d11-f27c-3aca-84bf-57ec0c9dbb31"))
        .to be_an_instance_of(Klarna::Response)
    end

    it 'returns an error response passing the wrong arguments' do
      expect(subject.call({}).success?).to be_falsy
    end

    it 'returns a success response passing the correct arguments' do
      response = subject.call("36b50d11-f27c-3aca-84bf-57ec0c9dbb31")
      expect(response.success?).to be_truthy
    end
  end

  describe '#release' do
    subject { ->(order_id) { Klarna.client(:order).release(order_id) } }

    it 'returns a response object' do
      expect(subject.call("62b809e8-b8c9-3be7-be36-80513716e7c0"))
        .to be_an_instance_of(Klarna::Response)
    end

    it 'returns an error response passing the wrong arguments' do
      expect(subject.call({}).success?).to be_falsy
    end

    it 'returns a success response passing the correct arguments' do
      response = subject.call("b7b0330f-8bbc-3f2a-bc84-41ec69f4efd7")
      expect(response.success?).to be_truthy
    end
  end

  describe '#acknowledge' do
    subject { ->(order_id) { Klarna.client(:order).acknowledge(order_id) } }

    it 'returns a response object' do
      expect(subject.call("36b50d11-f27c-3aca-84bf-57ec0c9dbb31"))
        .to be_an_instance_of(Klarna::Response)
    end

    it 'returns an error response passing the wrong arguments' do
      expect(subject.call({}).success?).to be_falsy
    end

    it 'returns a success response passing the correct arguments' do
      response = subject.call("b7b0330f-8bbc-3f2a-bc84-41ec69f4efd7")
      expect(response.success?).to be_truthy
    end
  end
end
