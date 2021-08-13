# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Klarna do
  describe '.client' do
    subject { described_class.client(type) }

    it 'returns Payment if the type is :payment' do
      expect(described_class.client(:payment)).to be_a(Klarna::Payment)
    end

    it 'returns Order if the type is :order' do
      expect(described_class.client(:order)).to be_a(Klarna::Order)
    end

    it 'returns Refund if the type is :refund' do
      expect(described_class.client(:refund)).to be_a(Klarna::Refund)
    end

    it 'returns Capture if the type is :capture' do
      expect(described_class.client(:capture)).to be_a(Klarna::Capture)
    end

    it 'returns nil if the type is :unknown' do
      expect(described_class.client(:unknown)).to be(nil)
    end
  end

  describe '.configuration' do
    it 'returns Klarna configuration' do
      expect(described_class.configuration).to be_an_instance_of(Klarna::Configuration)
    end
  end
end
