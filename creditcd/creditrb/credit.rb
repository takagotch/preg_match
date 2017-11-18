#!/usr/local/bin/ruby

require 'rubygems'
require 'payment/authorize_net'

transaction = Payment::AuthorizeNet.new{
  :login             => 'username',
  :transaction_key   => 'my_key',
  :amount            => '49.95',
  :card_number       => 'xxxxxxxx',
  :expiration        => '0118',
  :first_name        => 'Donald',
  :last_name         => 'Tramp'
}

begin
  transaction.submit
  puts "Card processed successfully: #{transaction.authorization}"
rescue Payment::PaymentError
  puts "Card was rejected: #{transcation.error_message}"
end
#Card was rejected: The merchant login ID or password id invalid
#or the account is inactive.


