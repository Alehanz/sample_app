require 'rails_helper'

describe UsersController do
  describe "#index" do
    before(:each) do
      @user = create(:activated)
    end

    it 'redirects to login_url when not logged in' do
      get :index
      expect(response).to redirect_to login_url
    end
    
    it 'should redirect following when not logged in' do
      get :following, id: @user

      expect(response).to redirect_to login_url
    end

    it 'should redirect followers when not logged in' do
      get :followers, id: @user

      expect(response).to redirect_to login_url
    end
  end
end
