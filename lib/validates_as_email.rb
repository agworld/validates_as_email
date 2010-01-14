module ActiveRecord
  module Validations
    module ClassMethods
      def validates_as_email *attr_names
        configuration = attr_names.extract_options!.reverse_merge(
          :message => :invalid_email_address,
          :with    => /^([\w\.!#\$%\-+.]+@[A-Za-z0-9\-]+(\.[A-Za-z0-9\-]+)+)$/
        )
        
        validates_format_of *attr_names.push(configuration)
      end
    end
  end
end

I18n.load_path += Dir[File.expand_path("#{File.dirname(__FILE__)}/../config/locales/*.yml")]

