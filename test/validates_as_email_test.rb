require 'test_helper'

class ValidatesAsEmailTest < Test::Unit::TestCase
  def test_illegal_addresses
    addresses = [
      'Max@Job 3:14',
      'Job@Book of Job',
      "J. P. 's-Gravezande, a.k.a. The Hacker!@example.com"
    ]
    
    addresses.each do |email|
      person = Person.new(:email => email)
      assert person.invalid?, "#{email} should be illegal"
    end
  end
  
  def test_legal_addresses
    addresses = [
      'test@example.com', 
      'test@example.co.uk',
      'someone@123.com',
    ]
    
    addresses.each do |email|
      person = Person.new(:email => email)
      assert person.valid?, "#{email} should be legal"
    end
  end
end

