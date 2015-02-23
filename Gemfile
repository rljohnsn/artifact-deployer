source 'https://rubygems.org'

# Old versions used
# gem 'foodcritic', '~> 3.0.3'
# gem 'minitest'
# gem 'rake'
# gem 'rspec', '= 3.0.0'
# gem 'guard-rspec'
# gem 'chefspec'
# gem 'berkshelf', '~> 3.1.5'

# TODO - add specific versions
gem 'foodcritic'
gem 'minitest'
gem 'rake'
gem 'rspec'
gem 'guard-rspec'
gem 'chefspec'
gem 'berkshelf'

# allow CI to override the version of Chef for matrix testing
# gem 'chef', (ENV['CHEF_VERSION'] || '>= 0.10.10')

# TODO use emeril or stove
# group :development do
#   gem 'emeril'
# end

group :integration do
  gem 'test-kitchen', '~> 1.3.1'
  gem 'kitchen-vagrant', '~> 0.15.0'
end
