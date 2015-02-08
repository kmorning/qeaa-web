source 'https://rubygems.org'

# Specify ruby version
ruby '2.2.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
#gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Deployment
gem 'capistrano', '~> 3.1.0'
gem 'capistrano-bundler', '~> 1.1.2'
gem 'capistrano-rails', '~> 1.1.1'
gem 'capistrano-rvm', github: "capistrano/rvm"

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

###############################################################
#
# App specific Gems
#
###############################################################

# foundation-rails - front-end framework 
# Invalid CSS !global with version 5.5.0.0
gem 'foundation-rails', '5.4.5.0'
# high_voltage - for static pages like "about"
gem 'high_voltage'
# Fix foundation scripts turbolinks break.
gem 'jquery-turbolinks'
# Role management
gem 'rolify'
# Use simple form with foundation
gem 'simple_form'
# TimeOfDay
gem 'tod'
# Birthdays and anniversaries
gem 'birthday'

###############################################################
#
# development - utilities that make development easier
#
###############################################################

group :development do
  # better_errors - helps when things go wrong
  gem 'better_errors'
  # quiet_assets - suppresses distracting messages in the log
  gem 'quiet_assets'
  # rails_layout - generates files for an application layout.
  #   We'll use this to set up Zurb Foundation and create the
  #   files we need.
  gem 'rails_layout'
end

################################################################
#
# production - deployment to Amazon EC2 intance
#
################################################################

group :production do
  # Thin web server - easy to use and requires no configuration
  #gem 'thin'
  # logging and static assets(CSS & JavaScript)
  #gem 'rails_12factor'
end
