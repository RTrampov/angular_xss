require 'pathname'
require 'active_support/all'
require 'action_dispatch'
require 'action_view'

module Rails
  def self.env
    'test'.inquiry
  end
end

require 'angular_xss'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

TEMPLATE_ROOT = Pathname.new(__dir__).join('templates')

RSpec.configure do |config|
  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end
