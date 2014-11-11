require 'rails_helper'

feature "Visitor signs up" do
  before { skip }
  scenario "with valid email and password" do
    sign_up_with 'Ivan', 'valid@example.com', 'password'

    expect(page).to have_content('Sign out')
  end

  scenario "witn invalid email" do
    sign_up_with 'name', 'invalid_email', 'password'

    expect(page).to have_content('Sign in')
  end


  def sign_up_with(name, email, password)
    visit signup_path
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Create my account'
  end
end
