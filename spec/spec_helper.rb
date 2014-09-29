require 'chefspec'
require 'chefspec/server'
require 'chefspec/librarian'

at_exit { ChefSpec::Coverage.report! }
