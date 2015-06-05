source 'https://rubygems.org'
ruby '2.1.5'#herokuのため

gem 'rails'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'haml-rails'
gem 'bootstrap-sass'
gem 'font-awesome-rails'
gem 'devise'
gem 'devise-i18n'
gem 'omniauth'
gem 'omniauth-remotty', git: 'https://github.com/SonicGarden/omniauth-remotty'
gem 'remotty', git: 'https://github.com/SonicGarden/remotty-ruby-client'
gem 'pg'
gem 'dotenv-rails'
gem 'sprockets'
group :development do
  gem 'guard-pow'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'annotate'
  gem 'hirb'
  gem 'hirb-unicode'
  gem 'html2haml'
end

group :development, :test do
  gem 'thin'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
end

group :staging, :production do
  gem 'unicorn'
  gem 'rails_12factor'
end
