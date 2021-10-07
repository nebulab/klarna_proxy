# frozen_string_literal: true

require 'klarna/version'
require 'klarna/configuration'
require 'klarna/client'
require 'klarna/response'
require 'klarna/order'
require 'klarna/capture'
require 'klarna/payment'
require 'klarna/refund'
require 'klarna/customer_token'

module Klarna
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.client(type = :order)
    case type
    when :payment
      Payment.new(configuration)
    when :order
      Order.new(configuration)
    when :refund
      Refund.new(configuration)
    when :capture
      Capture.new(configuration)
    when :customer_token
      CustomerToken.new(configuration)
    end
  end
end
