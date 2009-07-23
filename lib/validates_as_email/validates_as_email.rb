# Validation helper for ActiveRecord derived objects that cleanly and simply
# allows the model to check if the given string is a syntactically valid email
# address (by using the RFC822 module in rfc822.rb).
#
# Original code by Ximon Eighteen <ximon.eightee@int.greenpeace.org> which was
# heavily based on code I can no longer find on the net, my apologies to the
# author!
#
# Huge credit goes to Dan Kubb <dan.kubb@autopilotmarketing.com> for
# submitting a patch to massively simplify this code and thereby instruct me
# in the ways of Rails too! I reflowed the patch a little to keep the line
# length to a maximum of 78 characters, an old habit.

module ActiveRecord
  module Validations
    module ClassMethods
      def validates_as_email *attr_names
        configuration = {
          :message => :invalid_email,
          :with => RFC822::EmailAddress,
          :allow_nil => false
        }
        configuration.update(attr_names.extract_options!)

        validates_format_of attr_names, configuration
      end
    end
  end
end
