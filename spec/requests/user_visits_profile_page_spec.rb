require 'rails_helper'

feature 'User visits profile page' do
  before do
    @user = User.create(name: "Test",
                        email: "test@example.com",
                        password: "foobar",
                        password_confirmation: "foobar")
  end

  scenario 'successfully' do
    visit user_path(@user)

    expect(page).to have_content(@user.name)
  end
end
