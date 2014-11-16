require 'rails_helper'

feature 'User visits profile page' do
  before do
    @user = create(:user)
  end

  scenario 'sees their name' do
    visit user_path(@user)

    expect(page).to have_content(@user.name)
  end
end
