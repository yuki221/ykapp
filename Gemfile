source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.3.7'

gem 'rails', '~> 5.2.4', '>= 5.2.4.1'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', require: false
  gem 'rubocop-rails'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers', '~> 3.0'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'spring-commands-rspec'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :production, :staging do
  gem 'unicorn', '5.4.1'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'devise'
gem 'refile', github: 'refile/refile', require: 'refile/rails'
gem 'refile-mini_magick', github: 'refile/refile-mini_magick'
gem 'bootstrap', '~> 4.1.1'
gem 'jquery-rails'
gem 'acts-as-taggable-on', '~> 6.0'
gem 'kaminari'
gem 'rails-i18n', '~> 5.1'
gem 'mini_racer'
