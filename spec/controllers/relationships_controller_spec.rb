require 'rails_helper'

describe RelationshipsController do
  describe '#create' do
    it 'should redirect to login_url if not logged in' do
      post :create
      expect(response).to redirect_to login_url
    end
  end
end
