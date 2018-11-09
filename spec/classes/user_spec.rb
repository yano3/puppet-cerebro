require 'spec_helper'

describe 'cerebro::user' do
  on_supported_os(facterversion: '3.6').each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      let :default_shell do
        case facts[:osfamily]
        when 'Debian'
          '/usr/sbin/nologin'
        else
          '/sbin/nologin'
        end
      end

      context 'by default' do
        let(:pre_condition) { 'include cerebro' }
        it do
          is_expected.to contain_user('cerebro').with(
            'home' => '/opt/cerebro',
            'shell' => default_shell
          )
        end
      end

      context 'when cerebro_user is set' do
        let(:pre_condition) { 'class {\'cerebro\': cerebro_user => \'foo\'}' }

        it 'uses cerebro_user' do
          is_expected.to contain_user('foo')
        end
        it { is_expected.not_to contain_user('cerebro') }
      end

      context 'when shell is set to /bin/bash' do
        let(:pre_condition) { 'class {\'cerebro\': shell => \'/bin/bash\'}' }

        it do
          is_expected.to contain_user('cerebro').with_shell('/bin/bash')
        end
      end

      context 'when manage_user is false' do
        let(:pre_condition) { 'class {\'cerebro\': manage_user => false }' }
        it { is_expected.not_to contain_user('cerebro') }
      end
    end
  end
end
