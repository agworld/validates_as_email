require 'rubygems'

require 'test/unit'

require 'active_record'
require 'active_record/base'
require 'active_record/validations'

require 'validates_as_email'

class Person < ActiveRecord::Base
  def self.columns
    @columns ||= [
      ActiveRecord::ConnectionAdapters::Column.new('email', nil, 'string', true)
    ]
  end
  
  validates_as_email :email
end
