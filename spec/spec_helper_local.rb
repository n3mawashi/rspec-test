if ENV['RSPEC_CONSOLE_LOG'] == '1'
  RSpec.configure do |c|
    c.before(:each) do
      Puppet::Util::Log.level = :debug
      Puppet::Util::Log.newdestination(:console)
    end
  end
end
