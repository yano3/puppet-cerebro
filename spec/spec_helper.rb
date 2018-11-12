RSpec.configure do |c|
  c.mock_with :rspec
  c.after(:suite) do
    RSpec::Puppet::Coverage.report!
  end
end
require 'puppetlabs_spec_helper/module_spec_helper'
require 'rspec-puppet-facts'
include RspecPuppetFacts
