require "klarna/version"
require "klarna/configuration"
require "klarna/client"
require "klarna/response"
require "klarna/order"
require "klarna/capture"
require "klarna/credit"
require "klarna/refund"

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
    when :credit
      Credit.new(configuration)
    when :order
      Order.new(configuration)
    when :refund
      Refund.new(configuration)
    when :capture
      Capture.new(configuration)
    end
  end
end
