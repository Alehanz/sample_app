require 'rails_helper'

describe UsersController do
  describe "#index" do
    it 'redirects to login_url when not logged in' do
      get :index
      expect(response).to redirect_to login_url
    end
  end
end
