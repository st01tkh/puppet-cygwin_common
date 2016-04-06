require 'spec_helper'
describe 'cygwin_common' do

  context 'with defaults for all parameters' do
    it { should contain_class('cygwin_common') }
  end
end
