require 'simplecov'
SimpleCov.start

require 'rspec'

require 'rubbot'
require 'rubbot_cli'
require 'utils'

RSpec.configure do |config|
  config.formatter = :documentation
end

