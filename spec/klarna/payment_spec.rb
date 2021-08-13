# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Klarna::Payment do
  describe '#create_session' do
    subject { ->(params) { Klarna.client(:payment).create_session(params) } }

    it 'returns a response object' do
      expect(subject.call(PAYMENT_CREATE_SESSION))
        .to be_an_instance_of(Klarna::Response)
    end

    it 'returns an error response passing the wrong arguments' do
      expect(subject.call({}).success?).to be_falsey
    end

    it 'returns a success response passing the correct arguments' do
      response = subject.call(PAYMENT_CREATE_SESSION)
      expect(response.success?).to be_truthy
      expect(response.body).to include('session_id')
    end
  end

  describe '#update_session' do
    subject { ->(params) { Klarna.client(:payment).update_session('session_id', params) } }

    it 'returns a response object' do
      expect(subject.call(PAYMENT_UPDATE_SESSION))
        .to be_an_instance_of(Klarna::Response)
    end

    it 'returns an error response passing the wrong arguments' do
      expect(subject.call({}).success?).to be_truthy
    end

    it 'returns a success response passing the correct arguments' do
      response = subject.call(PAYMENT_UPDATE_SESSION)
      expect(response.success?).to be_truthy
    end
  end
end
