require 'spec_helper'

describe Authentication do
  
  context 'when validating' do
    subject(:authentication) { build(:authentication, params) }

    context 'with the default factory' do
      let(:params) { {} }
      specify { authentication.should be_valid }
    end

    context 'without a user' do
      let(:params) { {user_id: nil} }
      specify { authentication.should be_invalid }
    end

    context 'without a provider' do
      let(:params) { {provider: nil} }
      specify { authentication.should be_invalid }
    end

    context 'without a uid' do
      let(:params) { {uid: nil} }
      specify { authentication.should be_invalid }
    end

    context 'with a duplicate uid on a provider' do
      let!(:existing_authentication) { create(:authentication, provider: 'twitter', uid: '123456') }
      let(:params) { { provider: 'twitter', uid: '123456' } }
      specify { authentication.should be_invalid }
    end
  end

  context 'when authenticating' do
    context 'when an authentication does not exist' do
      subject(:authentication) { Authentication.authenticate(omniauth) }
      let(:omniauth) { { provider: 'twitter', uid: '123456', info: { name: 'Test User' } } }
      specify { authentication.should be_authenticated }
      specify { authentication.user.should be_present }
      specify { authentication.should be_persisted }
    end

    context 'when an authentication does exist' do
      let!(:existing_authentication) { Authentication.authenticate(omniauth) }
      subject(:authentication) { Authentication.authenticate(omniauth) }
      let(:omniauth) { { provider: 'twitter', uid: '123456', info: { name: 'Test User' } } }
      specify { authentication.should be_authenticated }
      specify { authentication.user_id.should == existing_authentication.user_id }
    end
  end
end
