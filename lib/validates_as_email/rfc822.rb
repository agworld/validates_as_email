#
# RFC822 Email Address Regex
# --------------------------
#
# Originally written by Cal Henderson
# c.f. http://iamcal.com/publish/articles/php/parsing_email/
#
# Translated to Ruby by Tim Fletcher, with changes suggested by Dan Kubb.
#
# Licensed under a Creative Commons Attribution-ShareAlike 2.5 License
# http://creativecommons.org/licenses/by-sa/2.5/
#
module RFC822
  module Patterns
    def self.compile(string)
      Regexp.new string, nil, 'n'
    end

    QTEXT     = compile "[^\\x0d\\x22\\x5c\\x80-\\xff]"
    DTEXT     = compile "[^\\x0d\\x5b-\\x5d\\x80-\\xff]"

    ATOM_CORE = compile "[^\\x00-\\x20\\x22\\x28\\x29\\x2c\\x2e\\x3a-\\x3c\\x3e\\x40\\x5b-\\x5d\\x7f-\\xff]+"
    ATOM_EDGE = compile "[^\\x00-\\x20\\x22\\x28\\x29\\x2c-\\x2e\\x3a-\\x3c\\x3e\\x40\\x5b-\\x5d\\x7f-\\xff]"
    ATOM      = compile "(?:#{ATOM_EDGE}{1,2}|#{ATOM_EDGE}#{ATOM_CORE}#{ATOM_EDGE})"

    QPAIR     = compile "\\x5c[\\x00-\\x7f]"
    QSTRING   = compile "\\x22(?:#{QTEXT}|#{QPAIR})*\\x22"

    WORD      = compile "(?:#{ATOM}|#{QSTRING})"

    DOMAIN_PT = compile "(?:[a-zA-Z0-9][\-a-zA-Z0-9]*[a-zA-Z0-9]|[a-zA-Z0-9]+)"

    DOMAIN    = compile "#{DOMAIN_PT}(?:\\x2e#{DOMAIN_PT})*"
    LOCAL_PT  = compile "#{WORD}(?:\\x2e#{WORD})*"
    ADDRESS   = compile "#{LOCAL_PT}\\x40#{DOMAIN}"
  end

  EmailAddress = /\A#{Patterns::ADDRESS}\z/
end

