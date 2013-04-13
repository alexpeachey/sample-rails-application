require 'spec_helper'

describe User do
  context 'when validating' do
    subject(:user) { build(:user, params) }

    context 'with the default factory' do
      let(:params) { {} }
      specify { user.should be_valid }
    end

    context 'without a name' do
      let(:params) { {name: nil} }
      specify { user.should be_invalid }
    end
  end
end
