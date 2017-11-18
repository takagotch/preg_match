#!/usr/local/bin/ruby

require 'rubygems'
require 'shipping'

ship = Shipping::Base.new(
  :dhl_url               => 'https://gatewaybeta.dhl.com/GatewayDC',
  :dhl_account           => 'xxxxxx',
  :dhl_meter             => '387878',

  :ups_account           => 'xxxxxxx',
  :ups_user              => 'takagotch',
  :ups_password          => 'password',

  :jp_accont             => 'xxxxxxx',
  :jp_user               => 'takagotch_jp',
  :jp_password           => 'password',

  :sender_zip            => 559111
)

ship.weight = 2
ship.city   = 'Portland'
ship.state  = 'OR'
ship.zip    = 97202

ship.ups.price
ship.dhl.price
ship.ups.valid_address?

ship.jp.price
ship.dhl.price
ship.jp.valid_address?


