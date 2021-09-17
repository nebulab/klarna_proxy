# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Klarna::Payment do
  describe '#shipping_info' do
    subject {
      ->(params) {
        Klarna.client(:capture).shipping_info('f5b2b1b3-4d70-39a7-8d30-86470631eee3',
                                              "d157b93a-bebf-491c-99e7-a99b0f2b60c2", params)
      }
    }

    it 'returns a response object' do
      expect(subject.call(CAPTURE_SHIPPING_INFO))
        .to be_an_instance_of(Klarna::Response)
    end

    it 'returns an error response passing the wrong arguments' do
      expect(subject.call({}).success?).to be_falsy
    end

    it 'returns a success response passing the correct arguments' do
      response = subject.call(CAPTURE_SHIPPING_INFO)
      expect(response.success?).to be_truthy
    end
  end
end
