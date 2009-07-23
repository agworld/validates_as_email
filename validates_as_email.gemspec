Gem::Specification.new do |s|
  s.name    = 'validates_as_email'
  s.version = '0.5.3'
  s.date    = '2009-07-22'
  
  s.summary     = 'Rails gem/plugin to validate format of email addresses (RFC822)'
  s.description = 'Rails gem/plugin that implements an ActiveRecord validation helper called validates_as_email which validates email address (RFC822)'
  
  s.authors  = ['Gabriel Sobrinho', 'Ximon Eighteen', 'Dan Kubb', 'Thijs van der Vossen']
  s.email    = 'gabriel.sobrinho@gmail.com'
  s.homepage = 'http://github.com/sobrinho/validates_as_email'
  
  s.files = ['CHANGELOG',
             'LICENSE',
             'README',
             'Rakefile',
             'init.rb',
             'lib/validates_as_email.rb',
             'lib/validates_as_email/validates_as_email.rb',
             'lib/validates_as_email/rfc822.rb',
             'lib/validates_as_email/locale/pt-BR.yml',
             'lib/validates_as_email/locale/en.yml',
             'test/test_helper.rb',
             'test/validates_as_email_test.rb']

  s.test_files = ['test/test_helper.rb', 'test/validates_as_email_test.rb']

  s.has_rdoc = false
end

