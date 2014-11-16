require 'rails_helper'

feature 'Visitor signs up' do

  scenario 'with valid email and password' do
    sign_up_with 'Ivan', 'valid@example.com', 'password'

    expect(page).to have_content('Log out')
  end

  scenario 'with invalid email' do
    sign_up_with 'Tom', 'invalid_email', 'foobar'

    expect(page).not_to have_content('Log out')
  end

  scenario 'with blank password' do
    sign_up_with 'Tom', 'test@example.com', ''

    expect(page).not_to have_content('Log out')
  end

end
