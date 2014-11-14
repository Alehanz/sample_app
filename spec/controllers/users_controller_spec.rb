require 'rails_helper'

describe UsersController do
  describe "#index" do
    subject { get :index }

    it "redirects to login_url when not logged in" do
      subject.should redirect_to login_url
    end
  end
end
