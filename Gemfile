source 'https://rubygems.org'

gem 'rails', '3.2.7'

gem 'jquery-rails'
gem 'sqlite3'
gem 'haml-rails'
gem 'awesome_print'

group :test do
  gem 'factory_girl_rails'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
end

group :development, :test do
  gem 'rspec-rails' #this goes here so generators know we use rspec by default
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
