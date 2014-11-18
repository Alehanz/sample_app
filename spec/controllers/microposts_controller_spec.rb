require 'rails_helper'

describe MicropostsController do
  before(:each) do
    @micropost = create(:micropost)
  end

  describe '#create' do
    it 'redirects to login_url when not logged in' do
      post :create, micropost: { content: 'Lorem ipsum' }
      expect(response).to redirect_to login_url
    end
  end

  describe '#destroy' do
    it 'redirects to login_url when not logged in' do
      delete :destroy, id: @micropost
      expect(response).to redirect_to login_url
    end
  end
end
