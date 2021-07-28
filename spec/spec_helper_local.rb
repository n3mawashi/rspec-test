# frozen_string_literal: true

if ENV['RSPEC_CONSOLE_LOG'] == '1'
  RSpec.configure do |c|
    c.before do
      Puppet::Util::Log.level = :debug
      Puppet::Util::Log.newdestination(:console)
    end
  end
end
