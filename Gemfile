source 'https://rubygems.org'

gem 'rails', '3.2.7'

gem 'jquery-rails'
gem 'haml-rails'
gem 'awesome_print'
gem 'bootstrap-sass'

gem 'pg' # for heroku

group :test do
  gem 'factory_girl_rails'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
end

group :development, :test do
  gem 'sqlite3' #use sqlite for dev & test, postgres for heroku
  gem 'rspec-rails' #this goes here so generators know we use rspec by default
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
