require 'spec_helper'

describe "Sidekiq" do
  describe '/sidekiq' do
    context 'when logged in' do
      context 'when an admin' do
        let(:user) { create(:user, admin: true) }
        let!(:authentication) { create(:authentication, provider: 'twitter', uid: '12345', user: user) }

        it 'should display the Sidekiq console' do
          login_with_oauth
          visit '/sidekiq'
          current_path.should == '/sidekiq'
        end
      end

      context 'when not an admin' do
        it 'should raise an error' do
          login_with_oauth
          expect { visit '/sidekiq' }.to raise_error
        end
      end
    end

    context 'when not logged in' do
      it 'should raise an error' do
        expect { visit '/sidekiq' }.to raise_error
      end
    end
  end
end
