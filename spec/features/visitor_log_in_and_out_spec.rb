require 'rails_helper'

feature "Visitor logs in and logs out" do
  before(:each) do
    @user = create(:user)
  end

  scenario "valid email and password" do
    visit login_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    expect(page).to have_content('Log out')
  end

  scenario "invalid email and password" do
    visit login_path

    fill_in 'Email', with: nil
    fill_in 'Password', with: nil
    click_button 'Log in'

    expect(page).to have_content('Invalid email/password
                                     combination')
  end

  scenario "user logs out" do
    visit login_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    click_link 'Log out'
    expect(page).to have_content('Log in')
  end

end
