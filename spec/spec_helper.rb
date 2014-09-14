require 'simplecov'
SimpleCov.start

require 'rspec'

RSpec.configure do |config|
  config.formatter = :documentation
end

require 'rubbot'
require 'utils'
