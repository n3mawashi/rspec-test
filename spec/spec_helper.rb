# frozen_string_literal: true

RSpec.configure do |c|
  c.mock_with :rspec
  c.formatter = :documentation
  c.before :each do
    # set to strictest setting for testing
    # by default Puppet runs at warning levels
    Puppet.settings[:strict] = :warning
  end
end

require 'puppetlabs_spec_helper/module_spec_helper'
require 'spec_helper_local' if File.file?(File.join(File.dirname(__FILE__), 'spec_helper_local.rb'))
