# frozen_string_literal: true

# Three tests needed
# * if region_pp is true returns it as country
# * if region is trie true return is as country
# * if all is false then use hostname to derive country

require 'facter'
require 'spec_helper'
require './lib/facter/region'

describe Facts::Region do
  let(:title) { 'region' }
  let(:node) { 'test2.example.com' }
  let(:facts) { { 'region' => 'bar' } } # Facts go here, and if no facts are needed, this can be omitted.
  # before(:each) {
  #  # Clear facter each run
  #  Facter.clear
  # }

  context 'region_pp set' do
    let(:facts) do
      {
        'pp_region' => 'foo'
      }
    end

    it { pp facts } # ??

    it {
      expect(subject).to eq('FOO')
    }
  end

  context 'region set' do
    it {
      expect(Facter.value(:country)).to eq('bar')
    }
  end
end
