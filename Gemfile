source 'http://rubygems.org'

gem 'rails', '3.0.10'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'haml', '~> 3.0'
gem 'simple-navigation', '~> 3.1.1'
gem 'devise', '~> 1.1.5'
gem 'cancan', '~> 1.5.1'
gem 'default_value_for', '~> 1.0.1'
gem 'rest-client', '~> 1.6.1'
gem 'jeditable-rails', '~> 0.1'
gem 'nokogiri', '~> 1.4.4'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

group :development do
  # for Devise generator
  gem 'hpricot'
  gem 'ruby_parser'
  
  gem 'thin'
  gem 'rack-fiber_pool', :require => 'rack/fiber_pool'
end

group :development, :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'ruby-debug19'
  
  gem 'rspec', '~> 2.4'
  gem 'rspec-rails'
  gem 'cucumber', '~> 0.10'
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'factory_girl', '>= 2.0.0.beta2', '< 3.0'
  gem 'factory_girl_rails', '>= 1.1.beta1'
end
