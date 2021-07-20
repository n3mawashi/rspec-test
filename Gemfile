
source 'https://rubygems.org'


gem 'puppet', "~> 6.12.0"
gem 'puppet-lint'
gem 'puppet-syntax'
gem 'puppetlabs_spec_helper'
gem 'rake'
gem 'rspec-core'
gem 'rspec-expectations',                                      require: false
gem 'rspec-puppet'
gem 'rubocop',                                                 require: false
gem 'rubocop-rake',                                            require: false
gem "rubocop-rspec",                                           require: false
gem "rubocop-i18n",                                            require: false
gem 'yamllint',                                                require: false

gems = {}

if Gem.win_platform?
  gems['win32-dir'] =      [require: false]
  gems['win32-eventlog'] = [require: false]
  gems['win32-process'] =  [require: false]
  gems['win32-security'] = [require: false]
  gems['win32-service'] =  [require: false]
end

gems.each do |gem_name, gem_params|
  gem gem_name, *gem_params
end

# vim: syntax=ruby
