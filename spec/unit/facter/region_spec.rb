# frozen_string_literal: true

# Three tests needed
# * if region_pp is true returns it as country
# * if region is trie true return is as country
# * if all is false then use hostname to derive country

# require 'facter'
require 'spec_helper'
# require './lib/facter/region'

describe Facter::Region do
  subject(:region)

  let(:title) { 'region' }
  let(:node) { 'test2.example.com' }
  let(:facts) { { 'region' => 'bar' } } # Facts go here, and if no facts are needed, this can be omitted.

  # before do
  #   # Clear facter each run
  #   Facter.clear
  # end

  context 'when region_pp is set' do
    let(:facts) do
      super().merge({ 'pp_region' => 'foo' })
    end

    it {
      expect(region).to eq('FOO')
    }
  end

  context 'when region_pp is no set' do
    it {
      expect(region).to eq('BAR')
    }
  end
end
