require 'rails_helper'

feature 'User edits their profile' do
  before(:each) do
    @user = create(:activated)
  end

  scenario 'edit with proper info' do
    visit edit_account_activation_path(@user, @user.activation_token, email: @user.email)
    log_in(@user)
    visit edit_user_path(@user)
    
    fill_in 'Name', with: 'Newname'
    fill_in 'Email', with: 'newemail@test.com'
    fill_in 'Password', with: @user.password
    fill_in 'Confirmation', with: @user.password
    click_button 'Save changes'

    expect(page).to have_content('Profile updated')
  end

  scenario 'leave name and email forms blank' do
    log_in(@user)
    visit edit_user_path(@user)

    fill_in 'Name', with: nil
    fill_in 'Email', with: nil
    fill_in 'Password', with: @user.password
    fill_in 'Confirmation', with: @user.password
    click_button 'Save changes'

    expect(page).to have_content('The form contains')
  end
end
