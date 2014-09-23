require 'simplecov'
SimpleCov.start

require 'rspec'
require 'stdin_helper'

require 'rubbot'
require 'rubbot_cli'

RSpec.configure do |config|
  config.formatter = :documentation
end

