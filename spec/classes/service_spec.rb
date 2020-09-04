require 'spec_helper'

describe 'cerebro::service' do
  on_supported_os(facterversion: '3.6').each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      context 'by default' do
        let(:pre_condition) { 'include cerebro' }

        it do
          is_expected.to contain_service('cerebro').with(
            'ensure' => 'running',
            'enable' => true
          )
        end
      end

      context 'when service_ensure set to stopped' do
        let(:pre_condition) { 'class {\'cerebro\': service_ensure => \'stopped\'}' }

        it { is_expected.to contain_service('cerebro').with_ensure('stopped') }
      end

      context 'when service_enable set' do
        let(:pre_condition) { 'class {\'cerebro\': service_enable => false }' }

        it { is_expected.to contain_service('cerebro').with_enable(false) }
      end
    end
  end
end
