require 'chefspec'
require 'chefspec/berkshelf'

# Check https://github.com/sethvargo/chefspec for more config options

at_exit { ChefSpec::Coverage.report! }
