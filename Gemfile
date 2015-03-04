source "https://rubygems.org"

gem "rails", "4.0.8"
gem 'bootstrap-sass'  

gem "unicorn"

gem "mysql2", ">= 0.3.14"

# uncomment to use PostgreSQL
gem "pg"
gem "puma"

# NOTE: If you use PostgreSQL, you must still leave enabled the above mysql2
# gem for Sphinx full text search to function.
gem 'rails_12factor'
gem "thinking-sphinx", "~> 3.1.0"
gem 'sass-rails', '>= 5.0.0.beta1'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'rails_admin'


gem "uglifier", ">= 1.3.0"
gem "jquery-rails"
gem "dynamic_form"

gem "exception_notification"

gem "bcrypt-ruby", "~> 3.1.2"

gem "nokogiri", "= 1.6.1"
gem "htmlentities"
gem "rdiscount"


# for twitter-posting bot
gem "oauth"

# for parsing incoming mail
gem "mail"

ruby "2.0.0"

group :test, :development do
  gem "rspec-rails", "~> 2.6"
  gem "machinist"
  gem "sqlite3"
  gem "faker"
end
