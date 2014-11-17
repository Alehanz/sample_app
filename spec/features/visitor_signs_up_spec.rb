require 'rails_helper'

feature 'Visitor signs up' do
  before(:each) do
    @user = build(:activated)
  end

  scenario 'with valid email and password' do
    sign_up_with 'Tom', 'validvalid@example.com', 'foobar'

    expect(page).to have_content('Please check your email
                                 to activate your account')
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
