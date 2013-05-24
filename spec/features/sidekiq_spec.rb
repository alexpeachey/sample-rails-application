require 'spec_helper'

describe "Sidekiq" do
  describe '/sidekiq' do
    context 'when logged in' do
      it 'should display the Sidekiq console' do
        login_with_oauth
        visit '/sidekiq'
        current_path.should == '/sidekiq'
      end
    end

    context 'when not logged in' do
      it 'should redirect to root' do
        expect { visit '/sidekiq' }.to raise_error
      end
    end
  end
end
