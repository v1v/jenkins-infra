require 'spec_helper'

describe 'profile::r10k' do
  context 'r10k.yaml' do
    it { should contain_file('/etc/puppetlabs/r10k/r10k.yaml') }
  end

  context 'r10k webhook' do
    it 'should configure r10k::webhook::config' do
      expect(subject).to contain_class('r10k::webhook::config').with({
        :enable_ssl => false,
        :protected => true,
        :use_mcollective => false,
      })
    end

    it 'should set up the webhook itself' do
      expect(subject).to contain_class('r10k::webhook').with({
        :use_mcollective => false,
        :user => 'root',
      })
    end
  end
end
