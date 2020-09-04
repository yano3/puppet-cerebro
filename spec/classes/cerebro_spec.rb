require 'spec_helper'

describe 'cerebro' do
  on_supported_os(facterversion: '3.6').each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('cerebro::params') }

      it do
        is_expected.to contain_class('cerebro::user')
          .that_comes_before('Class[cerebro::install]')
      end

      it { is_expected.to contain_class('cerebro::install') }

      it do
        is_expected.to contain_class('cerebro::config')
          .that_requires('Class[cerebro::install]')
      end

      it do
        is_expected.to contain_class('cerebro::service')
          .that_subscribes_to('Class[cerebro::config]')
          .that_subscribes_to('Class[cerebro::install]')
      end
    end
  end
end
