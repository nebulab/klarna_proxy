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

CUSTOMER_TOKEN_SESSION = {
  locale: 'en-US',
  intended_use: 'subscription',
  purchase_country: 'US',
  purchase_currency: 'USD',
  description: 'description',
  billing_address: {
    given_name: 'John',
    family_name: 'Doe',
    email: 'admin@example.com',
    phone: '12025550170',
    street_address: '8125 Centre St',
    postal_code: '36522-2156',
    city: 'Citronelle',
    country: 'US',
    region: 'AL'
  },
}.freeze

ORDER_CAPTURE = {
  captured_amount: 50,
  shipping_info: [{
    shipping_company: "company",
    tracking_number: 1245,
    tracking_url: "tracking.com"
  }]
}.freeze

ORDER_REFUND = {
  refunded_amount: 5,
  description: "description",
  reference: "reference"
}.freeze

CAPTURE_SHIPPING_INFO = {
  shipping_info: [{
    shipping_company: "DHL US",
    shipping_method: "Home",
    tracking_number: "63456415674545679874",
    tracking_uri: "http://shipping.example/findmypackage?63456415674545679874",
    return_shipping_company: "DHL US",
    return_tracking_number: "93456415674545679888",
    return_tracking_uri: "http://shipping.example/findmypackage?93456415674545679888"
  }]
}.freeze

PLACE_ORDER_PARAMS = {
  acquiring_channel: "ecommerce",
  attachment: {
    body: "{\"customer_account_info\":[{\"unique_account_identifier\":\"test@gmail.com\",\"account_registration_date\":\"2017-02-13T10:49:20Z\",\"account_last_modified\":\"2019-03-13T11:45:27Z\"}]}",
    content_type: "application/vnd.klarna.internal.emd-v2+json"
  },
  authorization_token: "cfbb0ccf-61b4-3ebc-addb-bfbd5ab5e4c2",
  auto_capture: false,
  billing_address: {
    city: "Hometown",
    country: "US",
    email: "jordy@gmail.com",
    family_name: "Doe",
    given_name: "John",
    phone: "12345678",
    postal_code: "12345",
    region: "CA",
    street_address: "Main Street",
  },
  client_token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJzZXNzaW9uX2lkIiA6ICIw",
  custom_payment_method_ids: [
    "string"
  ],
  customer: {
    date_of_birth: "1978-12-31",
    gender: "male",
    last_four_ssn: "1234",
    national_identification_number: "string",
    organization_entity_type: "LIMITED_COMPANY",
    organization_registration_id: "string",
    title: "Mr.",
    type: "organization",
    vat_id: "string"
  },
  design: "string",
  expires_at: "2038-01-19T03:14:07.000Z",
  locale: "en-GB",
  merchant_data: "{\"order_speicif\":[{\"substore\":\"Women's Fashion\",\"product_name\":\"Women Sweatshirt\"}]}",
  merchant_reference1: "ON4711",
  merchant_reference2: "hdt53h-zdgg6-hdaff2",
  merchant_urls: {
    confirmation: "https://...",
    notification: "https://...",
    push: "https://..."
  },
  options: {
    color_border: "#FF9900",
    color_border_selected: "#FF9900",
    color_details: "#FF9900",
    color_text: "#FF9900",
    radius_border: "5px"
  },
  order_amount: 3674,
  order_lines: [
    {
      name: "Running shoe",
      quantity: 1,
      total_amount: 2999,
      unit_price: 2999,
      type: "physical"
    },
    {
      name: "shipping",
      quantity: 1,
      total_amount: 500,
      unit_price: 500,
      type: "shipping_fee"
    },
    {
      name: "taxes",
      quantity: 1,
      total_amount: 175,
      unit_price: 175,
      type: "sales_tax"
    }
  ],
  payment_method_categories: [
    {
      asset_urls: {
        descriptive: "https://x.klarnacdn.net/payment-method/assets/badges/generic/klarna.svg",
        standard: "https://x.klarnacdn.net/payment-method/assets/badges/generic/klarna.svg"
      },
      identifier: "pay_later",
      name: "Pay Later"
    }
  ],
  purchase_country: "GB",
  purchase_currency: "USD",
  shipping_address: {
    city: "Hometown",
    country: "US",
    email: "jordy@gmail.com",
    family_name: "Doe",
    given_name: "John",
    phone: "12345678",
    postal_code: "12345",
    region: "CA",
    street_address: "Main Street",
  },
  status: "complete"
}.freeze
