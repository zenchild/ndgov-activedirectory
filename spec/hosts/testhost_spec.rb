require 'spec_helper'

describe 'testhost' do
  it { should include_class('activedirectory') }
end
