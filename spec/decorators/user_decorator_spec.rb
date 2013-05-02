require 'spec_helper'

describe UserDecorator do
  subject(:user) { build(:user).decorate }

  describe '#signed_in?' do
    context 'when not signed in' do
      specify { user.should_not be_signed_in }
    end

    context 'when signed in' do
      before { user.save }
      specify { user.should be_signed_in }
    end
  end
  
  describe '#authentication_link' do
    context 'when not signed in' do
      specify { user.authentication_link.should =~ /Sign In/ }
    end

    context 'when signed in' do
      before { user.save }
      specify { user.authentication_link.should =~ /Sign Out/ }
    end
  end

  describe '#account_link' do
    context 'when not signed in' do
      specify { user.account_link.should be_empty }
    end

    context 'when signed in' do
      before { user.save; user.reload; user.h.stub(:render) }
      it 'renders the account link' do
        user.h.should_receive(:render).with({partial: 'shared/account_link', locals: {user: user}})
        user.account_link
      end
    end
  end
end
