source 'https://rubygems.org'

#Install rails
gem 'rails', '4.2.5'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
#Use devise for authentication
gem 'devise', '< 3.5.2'

#Use puma as webserver
gem 'puma'

#Install bower to install javascript modules
gem 'bower-rails'

gem 'sprockets', '~> 2.0'
gem 'angular-rails-templates'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

#Generate sample customer data using faker
gem 'faker'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  #Use Rspec for testing
  gem 'rspec-rails', '~> 3.0'
  
  # START_HIGHLIGHT
  gem 'poltergeist'
  # END_HIGHLIGHT

  #Used to clean the database after a test run
  gem 'database_cleaner'
  
  #Run Jasmine unit tests in Rails
  gem 'teaspoon-jasmine'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end