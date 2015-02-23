source 'https://rubygems.org'

gem 'foodcritic', '~> 3.0.3'
gem 'minitest'
gem 'rake'
gem 'rspec', '= 3.0.0'
gem 'guard-rspec'
gem 'chefspec'
gem 'berkshelf', '~> 3.1.5'
gem 'test-kitchen', '~> 1.2.1'
gem 'kitchen-vagrant', '~> 0.15.0'

# Travis is failing with this set of gems
# gem 'foodcritic'
# gem 'minitest'
# gem 'rake'
# gem 'rspec'
# gem 'guard-rspec'
# gem 'chefspec'
# gem 'berkshelf'
# gem 'test-kitchen'
# gem 'kitchen-vagrant'

# allow CI to override the version of Chef for matrix testing
gem 'chef', (ENV['CHEF_VERSION'] || '>= 0.10.10')

group :development do
  gem 'emeril'
end
