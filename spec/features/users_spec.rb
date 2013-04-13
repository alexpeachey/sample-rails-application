require 'spec_helper'

describe "Users" do
  describe '/user/:id' do
    context 'when logged in' do
      it 'should have the name of the user' do
        login_with_oauth
        user = Authentication.where(provider: 'twitter', uid: '12345').first.user
        visit user_path(user)
        page.should have_content(user.name)
        current_path.should == user_path(user)
      end
    end

    context 'when not logged in' do
      let(:user) { create(:user) }
      it 'should redirect to root' do
        visit user_path(user)
        current_path.should == root_path
      end
    end
  end
end
