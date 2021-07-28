# frozen_string_literal: true

require 'spec_helper'

# Metrics/BlockLength:disabled
describe 'Nginx' do
  subject(:nginx)

  let(:title) { 'nginx' }
  let(:node) { 'test.example.com' }
  let(:facts) { {} } # Facts go here, and if no facts are needed, this can be omitted.
  let(:params) do
    { 'docroot' => '/u01' }
  end

  it { exepct(catalogue).to compile.with_all_deps }

  context 'with package installed' do
    it {
      expect(catalogue).to contain_package('nginx').with(ensure: 'present')
    }
  end

  context 'with directory /u01' do
    it {
      expect(:subject).to contain_file('/u01').with(ensure: 'directory')
    }
  end

  context 'with index file' do
    it {
      expect(:subject).to contain_file('/var/www/index.html').with(
        ensure: 'file',
        require: 'Package[nginx]'
      )
    }
  end

  context 'with service enabed and running' do
    it {
      expect(:subject).to contain_service('nginx').with(
        ensure: 'running',
        enable: true
      )
    }
  end
end
