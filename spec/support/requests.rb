# frozen_string_literal: true

PAYMENT_CREATE_SESSION = {
  locale: 'en-US',
  order_amount: 100,
  order_lines: [
    {
      name: 'Running shoes',
      quantity: 4,
      total_amount: 100,
      unit_price: 25
    }
  ],
  purchase_country: 'US',
  purchase_currency: 'USD'
}.freeze

PAYMENT_UPDATE_SESSION = {
  locale: 'en-US',
  order_amount: 200,
  order_lines: [
    {
      name: 'Running shoes',
      quantity: 4,
      total_amount: 200,
      unit_price: 50
    }
  ],
  purchase_country: 'US',
  purchase_currency: 'USD'
}.freeze
