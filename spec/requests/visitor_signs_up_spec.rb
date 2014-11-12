require 'rails_helper'

feature "Visitor signs up" do
  scenario "with valid email and password" do
    sign_up_with 'Ivan', 'valid@example.com', 'password'

    expect(page).to have_content('Ivan')
  end

  scenario "with invalid password and email" do
    sign_up_with 'Tom', 'invalid@test', 'pas'

    expect(page).not_to have_content('Tom')
  end


  def sign_up_with(name, email, password)
    visit signup_path
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Confirmation', with: password
    click_button 'Create my account'
  end
end
