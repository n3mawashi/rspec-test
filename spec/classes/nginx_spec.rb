# frozen_string_literal: true

require 'spec_helper'

describe 'nginx' do
  let(:title) { 'nginx' }
  let(:node) { 'test.example.com' }
  let(:facts) { {} } # Facts go here, and if no facts are needed, this can be omitted.
  let(:params) do
    { 'docroot' => '/u01' }
  end

  it { expect(subject).to contain_package('nginx').with_ensure('present') }

  it {
    expect(subject).to contain_file('/u01')
      .with(
        ensure: 'directory'
      )
  }

  it {
    expect(subject).to contain_file('/var/www/index.html')
      .with(
        ensure: 'file',
        require: 'Package[nginx]'
      )
  }

  it {
    expect(subject).to contain_service('nginx')
      .with(
        ensure: 'running',
        enable: true
      )
  }
end
