require 'rails_helper'

feature 'User edits their profile' do
  before { skip }
  before(:each) do
    @user = create(:user)
  end
  scenario 'edit successful' do
    log_in_and_visit_edit_path(@user)
    
    fill_in 'Name', with: 'Alex'
    fill_in 'Email', with: 'newemail@example.com'
    fill_in 'Password', with: 'foobar'
    fill_in 'Confirmation', with: 'foobar'
    click_button 'Save changes'

    expect(page).to have_content('Profile updated')
  end

  scenario 'leave forms blank' do
    log_in_and_visit_edit_path(@user)
    log_in(@user)
    visit edit_path(@user)

    fill_in 'Name', with: nil
    fill_in 'Email', with: nil
    fill_in 'Password', with: 'foo'
    fill_in 'Confirmation', with: 'foo'
    click_button 'Save changes'

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password is too short")
  end
  
  scenario 'not logged in' do
    visit login_path(@user)

    expect(page).to have_content('Log in')
  end

  def log_in(user)
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  def log_in_and_visit_edit_path(user)
    log_in(user)
    visit edit_user_path(user)
  end
end
