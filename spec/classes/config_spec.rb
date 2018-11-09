require 'spec_helper'

describe 'cerebro::config' do
  on_supported_os(facterversion: '3.6').each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      let :sysconfig_file do
        case facts[:osfamily]
        when 'Debian'
          '/etc/default/cerebro'
        else
          '/etc/sysconfig/cerebro'
        end
      end

      context 'by default' do
        let(:pre_condition) { 'include cerebro' }

        # TODO: Verify template contents
        it { is_expected.to contain_file('/etc/cerebro/application.conf').with_ensure('file') }
        it { is_expected.to contain_file(sysconfig_file).with_ensure('file').with_mode('0644') }
      end

      context 'with hosts set' do
        let(:pre_condition) { 'class {\'cerebro\': hosts => [{ "name" => "my_cluster", "host" => "http://127.0.0.1:9200"}] }' }
        describe 'configuration file' do
          it 'contains the hosts' do
            content = catalogue.resource('file', '/etc/cerebro/application.conf').send(:parameters)[:content]
            expect(content).to include('host = "http://127.0.0.1:9200"')
            expect(content).to include('name = "my_cluster"')
          end
        end
      end
    end
  end
end
