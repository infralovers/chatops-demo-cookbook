# encoding: utf-8

source 'https://rubygems.org'

gem 'berkshelf',  '~> 3.2'
gem 'chef',       '>= 12.0'

group :test do
  gem 'rake'
  gem 'chefspec', '~> 4.2.0'
  gem 'rspec_junit_formatter'
  gem 'foodcritic', '~> 4.0'
  gem 'thor-foodcritic'
  gem 'rubocop',    '~> 0.28.0'
  gem 'coveralls',  require: false
end

group :development do
  gem 'guard', '~> 2.12.5'
  gem 'guard-rspec'
  gem 'guard-kitchen'
  gem 'guard-rubocop'
  gem 'guard-foodcritic'
end

group :integration do
  gem 'test-kitchen', '~> 1.4'
  gem 'kitchen-vagrant', '~> 0.17'
end

group :openstack do
  gem 'kitchen-openstack'
end

group :docker do
  gem 'kitchen-docker'
end
