require 'spec_helper'

describe 'cerebro::install' do
  on_supported_os(facterversion: '3.6').each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      context 'by default' do
        let(:pre_condition) { 'include cerebro' }

        it do
          is_expected.to contain_file('/opt/cerebro-0.8.1').with(
            'ensure' => 'directory',
            'owner' => 'cerebro',
            'group' => 'cerebro',
            'mode' => '0755'
          )
        end

        it do
          is_expected.to contain_archive('/tmp/cerebro-0.8.1.tgz').with(
            'source' => 'https://github.com/lmenezes/cerebro/releases/download/v0.8.1/cerebro-0.8.1.tgz',
            'extract' => true,
            'extract_path' => '/opt',
            'creates' => '/opt/cerebro-0.8.1/bin',
            'cleanup' => true,
            'user' => 'cerebro',
            'group' => 'cerebro'
          )
          is_expected.to contain_archive('/tmp/cerebro-0.8.1.tgz').that_requires('File[/opt/cerebro-0.8.1]')
        end

        it do
          is_expected.to contain_file('/opt/cerebro').with(
            'ensure' => 'link',
            'target' => '/opt/cerebro-0.8.1'
          ).that_requires('Archive[/tmp/cerebro-0.8.1.tgz]')
        end

        ['/opt/cerebro/logs', '/etc/cerebro', '/var/cerebro', '/var/run/cerebro'].each do |directory|
          it do
            is_expected.to contain_file(directory).with(
              'ensure' => 'directory',
              'owner'  => 'cerebro',
              'group'  => 'cerebro'
            )
          end
        end

        it do
          is_expected.to contain_file('/var/log/cerebro').with(
            'ensure' => 'link',
            'target' => '/opt/cerebro/logs',
          )
        end

        # TODO: Verify template contents
        it { is_expected.to contain_file('/etc/tmpfiles.d/cerebro.conf').with_ensure('file') }
        it { is_expected.to contain_systemd__unit_file('cerebro.service') }
      end
    end
  end
end
