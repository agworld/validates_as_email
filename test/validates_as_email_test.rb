require 'test_helper'

class ValidatesAsEmailTest < ActiveSupport::TestCase
  test 'illegal RFC822 e-mail addresses' do
    addresses = [
      'Max@Job 3:14', 
      'Job@Book of Job',
      'J. P. \'s-Gravezande, a.k.a. The Hacker!@example.com',
    ]

    addresses.each do |address|
      assert_match RFC822::Email, address, "#{address} should be illegal."
    end
  end

  test 'legal RFC822 e-mail addresses' do
    addresses = [
      'test@example',
      'test@example.com', 
      'test@example.co.uk',
      '"J. P. \'s-Gravezande, a.k.a. The Hacker!"@example.com',
      'me@[187.223.45.119]',
      'someone@123.com',
    ]

    addresses.each do |address|
      assert_match RFC822::Email, address, "#{address} should be legal."
    end
  end
end

